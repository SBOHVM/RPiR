#' @title Simplest code to run a simulation loop
#'
#' @description
#' A generic function to run a simulation loop for a fixed period of time.
#' \code{run_simple()} will call \code{step_function(initial.pop, ...)} over
#' and over until the time ends or \code{step_function()} reports that the
#' experiment has ended.
#'
#' @seealso \code{\link{run_simulation}} if you want a more flexible version
#' of this function that will allow your \code{step_function()} to return just a
#' data frame and will print some debugging information on request.
#'
#' @param step_function Function to run a timestep (\code{step_function()})
#' which returns a list containing elements \code{updated.pop} with the
#' updated population and \code{end.experiment} which is TRUE if the
#' experiment has ended (FALSE if not)
#' @param initial.pop Initial population data frame with columns corresponding
#' to function requirements. This *must* include a \code{time} column so that
#' \code{run_simple()} can check whether the \code{end.time} has been reached.
#' @param end.time End time of simulation
#' @param ... (optionally) any other arguments for \code{step_function()},
#' e.g. parameters or timestep
#'
#' @return Data frame containing population history of simulation over time
#'
#' @export
#'
#' @examples
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
#' results <- run_simple(growth, df, 100, growth.rate = 0.1)
#' plot_populations(results)
#'
run_simple <- function(step_function, initial.pop, end.time, ...) {
  # Check whether step_function uses global variables
  RPiR::assert_no_globals(step_function,
                          name = deparse1(substitute(step_function)))

  population.df <- latest.df <- initial.pop
  keep.going <- (latest.df$time < end.time)
  while (keep.going) {
    data <- step_function(latest.df, ...)
    latest.df <- data$updated.pop
    population.df <- rbind(population.df, latest.df)
    keep.going <- (latest.df$time < end.time) && (!data$end.experiment)
  }
  row.names(population.df) <- NULL
  population.df
}
