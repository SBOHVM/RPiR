#' available_lectures
#'
#' @export
#'
available_lectures <- function() {
  tmp <- system.file(package = "RPiR")
  tmp <- dir(file.path(tmp, "lectures"))
  tmp <- tmp[grep("Rmd", tmp)]
  tmp <- gsub(".Rmd", "", tmp[grep("RPiR", tmp)])
  cat("Available lectures:")
  cat("\n* RPiR")
  for(i in seq_len(length(tmp))) cat("\n  -", tmp[i])
}
