#' run_practical
#'
#' @param name Name of the practical
#'
#' @export
#'
run_practical <- function(name) {
 learnr::run_tutorial(name = name, package = "RPiR")
}
