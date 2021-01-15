#' run_lecture
#'
#' @param name Name of the lecture
#'
#' @export
#'
run_lecture <- function(name) {
  tmp <- system.file(file.path("lectures", paste0(name, ".Rmd")), package = "RPiR")
  out_path <- rmarkdown::render(tmp, envir = new.env())
  browseURL(out_path)
}
