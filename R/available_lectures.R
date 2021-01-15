#' available_lectures
#'
#' @export
#'
available_lectures <- function() {
  tmp <- system.file(package = "RPiR")
  tmp <- dir(file.path(tmp, "lectures"))
  tmp <- tmp[grep("Rmd", tmp)]
  gsub(".Rmd", "", tmp[grep("RPiR", tmp)])
}
