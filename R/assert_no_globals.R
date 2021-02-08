#' assert_no_globals
#'
#' @description
#' This function will stop code execution with an error if the function
#' passed in has a global variable
#'
#' @param test_function function to check for global variables
#' @param name optionally (otherwise taken from test_function) name of function
#'
#' @return nothing
#' @export
#'
assert_no_globals <- function(test_function,
                              name = deparse1(substitute(test_function))) {
  globals <- codetools::findGlobals(test_function, merge = FALSE)$variables
  if (length(globals) != 0) {
    stop(paste0("Function ", name,
                "() may not use global variable(s): ", globals))
  }
  NULL
}
