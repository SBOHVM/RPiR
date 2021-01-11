#' @title Simplest code to run a simulation loop
#'
#' @description
#' A generic function to run a simulation loop for a fixed period of time.

#' @param step_function Function to run a timestep (\code{step_function()})
#'   which returns a list containing elements \code{updated.pop} with the
#'   updated population and \code{end.experiment} which is TRUE if the
#'   experiment has ended (FALSE if not)
#' @param initial.pop Initial population data frame with columns corresponding
#'   to function requirements
#' @param end.time End time of simulation
#' @param ... (optionally) any other arguments for \code{step_function()},
#'   e.g. parameters or timestep
#'
#' @return Data frame containing population history of simulation over time
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
#' results <- run_simple(growth, df, 100, growth.rate=0.1)
#' plot_populations(results)
#'
run_simple <- function(step_function, initial.pop, end.time, ...)
{
  # Check whether step_function uses global variables
  if (length(codetools::findGlobals(step_function, merge=FALSE)$variables) > 0)
    warning(paste("Function provided uses global variable(s):",
                  paste(codetools::findGlobals(step_function, merge=FALSE)$variables,
                        collapse=", ")))

  population.df <- latest.df <- initial.pop
  keep.going <- (latest.df$time < end.time)
  while (keep.going)
  {
    data <- step_function(latest.df, ...)
    latest.df <- data$updated.pop
    population.df <- rbind(population.df, latest.df)
    keep.going <- (latest.df$time < end.time) && (!data$end.experiment)
  }
  row.names(population.df) <- NULL
  population.df
}
