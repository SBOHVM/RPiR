#' @title Run an integration over time
#'
#' @description
#' A generic function to integrate a series of ODEs. Designed to
#' have arguments compatible with other run_xxx() functions, rather than
#' optimally designed for ode(). deriv_function must have three arguments (t,
#' pop_vec, param_vec), where t is the time, pop_vec contains the current state
#' of the population in a vector with named elements, and param_vec contains a
#' vector of named parameters. It must return a list with two elements, the
#' first of which is a vector of the derivatives of the population at pop_vec,
#' and the second is an empty vector.
#'
#' @param deriv_function Function to calculate derivative
#' @param populations Data frame with columns corresponding to function
#'   requirements
#' @param end.time End time of simulation
#' @param timestep (optionally) record the state every timestep - default 1
#' @param debug (optionally) Do you want to print out a limited amount of
#'   debugging information about your code? - default FALSE
#' @param ... Other arguments for deriv_function, mostly parameters
#'
#' @return Data frame containing population history of simulation over time
#'
#' @export
#'
run_integration <- function(deriv_function, populations, end.time,
                            timestep = 1, debug = FALSE, ...) {
  if (length(codetools::findGlobals(deriv_function, merge = FALSE)$variables) > 0)
    warning(paste("Function provided uses global variable(s):",
                  paste(codetools::findGlobals(deriv_function,
                                               merge = FALSE)$variables,
                        collapse = ", ")))
  if (debug) {
    cat(c("Population names being used: ",
          paste(colnames(populations), collapse = ", "),
          "\n"))
    cat(c("Parameter names being used: ",
          paste(names(c(...)), collapse = ", "),
          "\n"))
  }
  # Translate run.integration parameters into ones for ode()
  current.time <- utils::tail(populations$time, 1)
  times <- seq(from = current.time, to = end.time, by = timestep)
  initial.populations <- unlist(populations)
  initial.populations <- initial.populations[names(initial.populations) != "time"]
  params <- c(...)

  if (debug) {
    cat("Derivatives returned from first run: ",
        paste(deriv_function(current.time, initial.populations, params)[[1]],
              collapse = ", "),
        "\n")
  }

  # Now run ode, turn back into data frame, add times and return
  matrix.populations <- deSolve::ode(initial.populations, times,
                                     deriv_function, params)
  final.populations <- as.data.frame(matrix.populations)
  final.populations$time <- times
  final.populations
}
