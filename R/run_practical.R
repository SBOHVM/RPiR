#' Run practical
#'
#' This function runs a lecture from the RPiR course.
#'
#' @param name Name of the practical
#'
#' @export
#'
#' @examples
#' \dontrun{
#' run_practical("practical1-1")
#' }
#'
run_practical <- function(name) {
 learnr::run_tutorial(name = name, package = "RPiR")
}
