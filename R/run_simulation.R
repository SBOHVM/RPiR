#' @title Run a simulation loop
#'
#' @description
#' A generic function to run a simulation loop for a fixed period of time.
#' This function can cope with model step functions that return an updated
#' data frame, or functions that return a list with an \code{end.experiment}
#' element and an \code{updated.pop} element. If the simulation isn't working
#' you can set \code{debug = TRUE} in the arguments, and it will print some
#' (potentially) useful debugging information while it runs. It will also
#' check whether your function has any global variables.
#'
#' @seealso \code{\link{run_simple}} if you want a much simpler but more
#' restrictive version of the simulation code that may be useful for better
#' understanding how the function works.
#'
#' @param step_function Function to run a timestep (\code{step_function()})
#' which returns a list containing elements \code{updated.pop} with the
#' updated population and \code{end.experiment} which is TRUE if the
#' experiment has ended (FALSE if not), OR which just returns a data frame
#' with the updated population
#' @param initial.pop Initial population data frame with columns corresponding
#' to function requirements. This *must* include a \code{time} column so that
#' \code{run_simple()} can check whether the \code{end.time} has been reached.
#' @param end.time End time of simulation
#' @param debug (optionally) do you want to print out a limited amount of
#' debugging information about your code? - default FALSE
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
#' results <- run_simulation(growth, df, 100, growth.rate=0.1, debug=TRUE)
#' plot_populations(results)
#'
run_simulation <- function(step_function, initial.pop, end.time,
                           debug=FALSE, ...) {
  # Check whether step_function uses global variables
  RPiR::assert_no_globals(step_function,
                          name = deparse1(substitute(step_function)))

  # Collect and report debugging information to identify sources of errors
  pop.names <- colnames(initial.pop)
  if (debug) {
    cat(c("Population names being used: ",
          paste(pop.names, collapse = ", "), "\n"))
    if (nrow(initial.pop) != 1)
      warning("Input dataframe initial.pop has ", nrow(initial.pop), " rows")
    cat(c("Parameter names being used: ",
          paste(names(c(...)), collapse = ", "), "\n"))
  }

  keep.going <- (initial.pop$time < end.time)
  if (debug && keep.going) {
    data <- step_function(initial.pop, ...)
    if (is.data.frame(data)) {
      # We have an experiment that doesn't end, or can't determine when it does
      latest.df <- data
      ended <- FALSE
      cat("step_function() returns a data frame.\n")
    } else {
      # If a list, we have an experiment that can determine when it ends
      cat("step_function() returns a list.\n")
      list.names <- c("updated.pop", "end.experiment")
      if (any(names(data) != list.names)) {
        cat("Names of elements in list: ",
            paste(names(data), collapse = ", "), "\n")
        if (any(sort(names(data)) != sort(list.names)))
          stop("Misnamed list elements returned from step_function(): ",
               paste(names(data), collapse = " and "),
               ", not updated.pop and end.experiment.")
      }
      latest.df <- data$updated.pop
      ended <- data$end.experiment
      cat("end.experiment returned from first run: ", ended, "\n")
    }

    cat("Population returned from first run: ",
        paste(latest.df, collapse = ", "), "\n")
    ret.names <- colnames(latest.df)
    if (any(ret.names != pop.names)) {
      cat("Population names being used in output: ",
          paste(ret.names, collapse = ", "), "\n")
      if (any(sort(ret.names) != sort(pop.names)))
        stop("Mismatch in input and output population dataframe column names")
      else
        print("Input and output dataframe column names in different order")
    }
    population.df <- rbind(initial.pop, latest.df)
    keep.going <- (latest.df$time < end.time) && (!ended)
  } else {
    latest.df <- initial.pop
    population.df <- initial.pop
  }

  while (keep.going) {
    data <- step_function(latest.df, ...)
    if (is.data.frame(data)) {
      # We have an experiment that doesn't end, or can't determine when it does
      latest.df <- data
      ended <- FALSE
    }
    else { # If a list, we have an experiment that can determine when it ends
      latest.df <- data$updated.pop
      ended <- data$end.experiment
    }

    if (debug) {
      if (nrow(latest.df) != 1)
        cat("Output dataframe has ", nrow(latest.df), " rows\n")
      if (any(is.na(latest.df)))
        cat("Output dataframe has NAs: ", paste(latest.df, collapse = ", "), "\n")
    }
    population.df <- rbind(population.df, latest.df)
    keep.going <- (latest.df$time < end.time) && (!ended)
  }
  row.names(population.df) <- NULL
  population.df
}
