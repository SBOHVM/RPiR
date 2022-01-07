#' List currently available practicals
#'
#' This function lists all currently available lectures.
#'
#' @param verbose Add the description text if TRUE (default FALSE)
#'
#' @export
#'
#' @examples
#' available_lectures()
#'
available_practicals <- function(verbose = FALSE) {
  path <- system.file("tutorials", package = "RPiR")
  if (rlang::is_empty(path) || path == "")
    stop("RPiR package does not contain a tutorials folder")
  files <- list.files(path, pattern = "\\.Rmd$", recursive = TRUE)
  files <- export_materials(files, type = "exercises")
  if (length(files) == 0)
    cat("No practicals available for RPiR")
  else {
    cat("Available practicals:\n")
    for (practical in files) {
      name <- gsub("(.*)[\\/](.*)\\.Rmd", "\\2", practical)
      front_matter <- rmarkdown::yaml_front_matter(file.path(path, practical))
      cat(paste0("\"", name, "\" - ", front_matter$title), "\n")
      if (verbose)
        cat(strsplit(front_matter$description, split = " +")[[1]], "\n",
            fill = 70, labels = "  ")
    }
  }
}
