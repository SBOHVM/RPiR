#' clean_cached_exercises
#'
#'
clean_cached_exercises <- function() {
  path <- system.file("tutorials", package = "RPiR")
  if (rlang::is_empty(path) || path == "")
    stop("RPiR package does not contain a tutorials folder")
  files <- list.files(path, pattern = "\\.Rmd$", recursive = TRUE)
  for (rmd in files)
    rmarkdown::shiny_prerendered_clean(file.path(path, rmd))
}
