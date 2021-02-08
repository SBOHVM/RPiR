#' assert_no_globals
#'
#' @description
#' This function will stop code execution with an error if the function
#' passed in has a global variable
#'
#' @param fname function name to check for global
#'
#' @return nothing
#' @export
#'
assert_no_globals <- function(fname) {
  globals <- codetools::findGlobals(fname, merge = FALSE)$variables
  if (length(globals) != 0) {
    stop(paste0("Function ", deparse1(substitute(fname)),
                "() may not use global variable(s): ", globals))
  }
  NULL
}
