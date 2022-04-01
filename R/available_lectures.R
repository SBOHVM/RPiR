#' List currently available lectures
#'
#' This function lists all currently available lectures.
#'
#' @export
#'
#' @examples
#' available_lectures()
#'
available_lectures <- function() {
  path <- system.file("lectures", package = "RPiR")
  if (rlang::is_empty(path) || path == "")
    stop("RPiR package does not contain a lectures folder")
  files <- list.files(path, pattern = "\\.Rmd$", recursive = TRUE)
  files <- export_materials(files, type = "lectures")
  if (length(files) == 0)
    cat("No lectures available for RPiR")
  else {
    cat("Available lectures:\n")
    for (lecture in files) {
      name <- gsub(".Rmd", "", lecture)
      front_matter <- rmarkdown::yaml_front_matter(file.path(path, lecture))
      cat(paste0("\"", name, "\" - ", front_matter$title, "\n"))
    }
  }
}
