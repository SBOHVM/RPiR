#' dummy_package
#'
#' This function
#'
#' @export
#'
dummy_package <- function() {
  # Package name
  path <- "package0301"

  # Create package structure
  usethis::create_package(path)

  dir.create(file.path(path, "demo"))
  usethis::ui_done(paste("Creating", usethis::ui_path("demo")))

  # Add demo
  tmp <- system.file("dummy_package/0105-run-birth-death.R", package = "RPiR")
  file.copy(tmp, file.path(path, "demo", basename(tmp)))
  usethis::ui_done(paste("Writing", usethis::ui_value(basename(tmp))))

  # Add function
  tmp <- system.file("dummy_package/step_birth_death.R", package = "RPiR")
  file.copy(tmp, file.path(path, "R", basename(tmp)))
  usethis::ui_done(paste("Writing", usethis::ui_value(basename(tmp))))

  devtools::document(path, quiet = TRUE)
  usethis::ui_done("Documenting package functions")
}
