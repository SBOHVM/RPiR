#' assert_no_globals
#'
#' @description
#' This function will stop code execution with an error if the function
#' passed in has a global variable
#'
#' @param test_function function to check for global variables
#' @param name (optional) the name of function as a string -- passed to the
#' error message
#'
#' @return nothing
#' @export
#'
#' @examples
#' \dontrun{
#' broken_function <- function() print(y)
#' assert_no_globals(broken_function)
#' assert_no_globals(broken_function, name = "the_name_of_my_function")
#' }
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
