#' @title Cleaning up data
#'
#' @description
#' Cleanup times in population data frame, so that they are regularly
#' spaced and stop at the correct time, using either means to
#' interpolate new data points or previous value for events. We assume
#' when the data frame stops before end.time that the state then
#' remaining unchanged.
#'
#' @param populations - a data frame with columns corresponding to different
#'    population segments and a 'time' column
#' @param are.events - whether the times in the data frame are events
#'    (therefore should take last event to determine state) or not
#'    (therefore interpolate)
#' @param timestep - (optionally) timestep required for times - default 1
#' @param end.time - (optionally) end of simulation time required - default
#'    \code{max(populations$time)}
#' @param times - (optionally) vector of times to be reproduced - default
#'    \code{seq(from=min(populations$time), to=end.time, by=timestep)}
#' @param ... - pass through arguments for \code{cleanup_events()} and
#'    \code{cleanup_timesteps()} to \code{cleanup_times()}
#'
#' @return
#' Revised data frame with correct timings
#'
#' @details
#' \code{cleanup_events()} cleans up times of an event-based population data
#' frame, \code{cleanup_timesteps()} cleans up times of an timestep-based
#' population data frame.
#'
#' @export
#'
#' @examples
#'
#' growth <- function(latest.df, growth.rate) {
#' current.count <- latest.df$count
#' growth.num <- current.count * growth.rate
#' next.count <- current.count + growth.num
#' next.time <- latest.df$time + 1
#' new.df <- data.frame(time=next.time, count=next.count)
#' finished <- next.count == 0
#' list(updated.pop=new.df, end.experiment=finished)
#' }
#' df <- data.frame(time=0, count=1)
#' results <- run_simulation(growth, df, 100, growth.rate=0.1)
#' plot_populations(results)
#' short.results <- cleanup_timesteps(results, timestep=20, end.time=80)
#' plot_populations(short.results, new.graph=FALSE, lty=2)
#'
cleanup_times <- function(populations, are.events, timestep=1,
                          end.time = max(populations$time),
                          times = seq(from = min(populations$time),
                                      to = end.time, by = timestep)) {
  if (times[1] < min(populations$time))
    stop("Requested times start before beginning of input data frame")
  new.pops <- populations[FALSE,]
  for (time in times) {
    if (are.events) # If we are event-based, find last event
      next.pop <- utils::tail(populations[populations$time <= time,], 1)
    else # otherwise
      if (any(populations$time > time)) {
        # if we are in the middle of a sequence, interpolate
        before <- utils::tail(populations[populations$time <= time,], 1)
        after <- utils::head(populations[populations$time > time,], 1)
        next.pop <- (before * (after$time - time) +
                       after * (time - before$time)) /
          (after$time - before$time)
      } else
        # if we are at the end, use last step
        next.pop <- utils::tail(populations, 1)
      next.pop$time <- time
      new.pops <- rbind(new.pops, next.pop)
      row.names(new.pops) <- NULL
  }
  new.pops
}

#' @rdname cleanup_times
#' @export
cleanup_events <- function(populations, ...) {
  cleanup_times(populations, TRUE, ...)
}

#' @rdname cleanup_times
#' @export
cleanup_timesteps <- function(populations, ...) {
  cleanup_times(populations, FALSE, ...)
}
