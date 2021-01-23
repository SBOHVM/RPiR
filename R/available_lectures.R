#' available_lectures
#'
#' @export
#'
available_lectures <- function() {
  path <- system.file("lectures", package = "RPiR")
  if (rlang::is_empty(path) || path == "")
    stop("RPiR package does not contain a tutorials folder")
  files <- list.files(path, pattern = "\\.Rmd$", recursive = TRUE)
  tmp <- gsub(".Rmd", "", files)
  cat("Available lectures:")
  cat("\n* RPiR")
  for (i in seq_len(length(tmp)))
    cat("\n  -", tmp[i])
}
