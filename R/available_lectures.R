#' available_lectures
#'
#' @param package Package name, *i.e. * "RPiR"
#'
#' @export
#'
#' @examples
#' \dontrun{
#' available_lectures("RPiR")
#' }
#'
available_lectures <- function(package) {
  tmp <- system.file(package = package)
  tmp <- dir(file.path(tmp, "lectures"))
  tmp <- tmp[grep("Rmd", tmp)]
  tmp <- gsub(".Rmd", "", tmp[grep("RPiR", tmp)])
  cat("Available lectures:")
  cat("\n* RPiR")
  for(i in seq_len(length(tmp))) cat("\n  -", tmp[i])
}
