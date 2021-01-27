#' practical_series_one
#'
#' This function will populate the current working directory with scripts and
#' functions from practical series 1.
#'
#' @param force - overwrite existing files if TRUE (default FALSE)
#'
#' @export
#'
practical_series_one <- function(force = FALSE) {
  if (is.null(rstudioapi::getActiveProject()))
    stop("You are not in an active RStudio project, please create one first")

  files <- system.file("dummy_project", package = "RPiR")
  files <- dir(files, full.names = TRUE)

  for (i in seq_along(files)) {
    if (file.copy(files[i], ".", overwrite = force))
      usethis::ui_done(paste("Writing", usethis::ui_value(basename(files[i]))))
    else
      usethis::ui_oops(paste("Writing", usethis::ui_value(basename(files[i]))))
  }
}
