#' Run lecture
#'
#' This function runs a lecture from the RPiR course.
#'
#' @param name Name of the lecture
#'
#' @export
#'
#' @examples
#' \dontrun{
#' run_lecture("RPiR1-intro")
#' }
#'
run_lecture <- function(name) {
  tmp <- system.file(file.path("lectures", paste0(name, ".Rmd")), package = "RPiR")
  out_path <- rmarkdown::render(tmp, envir = new.env())
  browseURL(out_path)
}
