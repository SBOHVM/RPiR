#' dummy_package
#'
#' This function will create an RStudio project called `package0301` and
#' populate it with `0105-run-birth-death.R` (now `run-birth-death.R`), and
#' `0105-step-birth-death.R` (now `step_deterministic_birth_death.R`).
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
  tmp <- system.file("dummy_package/d0105-run-birth-death.R", package = "RPiR")
  file.copy(tmp, file.path(path, "demo", "0301_run_birth_death.R"))
  usethis::ui_done(paste("Writing", usethis::ui_value("0301_run_birth_death.R")))

  tmp <- "d0301_run_birth_death   Simple birth-death difference equation model"
  cat(tmp, file = file.path(path, "demo", "00Index"))
  usethis::ui_done(paste("Writing", usethis::ui_value("00Index")))

  # Add function
  tmp <- system.file("dummy_package/step_birth_death.R", package = "RPiR")
  file.copy(tmp, file.path(path, "R", "step_deterministic_birth_death.R"))
  usethis::ui_done(paste("Writing", usethis::ui_value(basename(tmp))))

  # Add package file
  tmp <- system.file("dummy_package/package0301-package.R", package = "RPiR")
  file.copy(tmp, file.path(path, "R", basename(tmp)))
  usethis::ui_done(paste("Writing", usethis::ui_value(basename(tmp))))

  devtools::document(path, quiet = TRUE)
  usethis::ui_done("Documenting package functions")
}
