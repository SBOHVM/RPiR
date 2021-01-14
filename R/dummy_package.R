#' dummy_package
#'
#' This function will create an RStudio project called `package0301` and
#' populate it with `0105-run-birth-death.R` (now `run-birth-death.R`), and
#' `0105-step-birth-death.R` (now `step_deterministic_birth_death.R`).
#'
#' @param package_name a \code{string} corresponding to the name you want to
#' give your package; this should be your GitHub user name.
#'
#' @export
#'
dummy_package <- function(package_name) {
  # Create package structure
  package_dir <- usethis::create_package(package_name)

  # Create demo/ directory
  dir.create(file.path(package_name, "demo"))
  usethis::ui_done(paste("Creating", usethis::ui_path("demo")))

  # Write demo
  tmp <- system.file("dummy_package/0105-run-birth-death.R", package = "RPiR")
  file.copy(tmp, file.path(package_name, "demo", "d0301_run_birth_death.R"))
  usethis::ui_done(paste("Writing", usethis::ui_value("0301_run_birth_death.R")))

  # Write demo index file
  tmp <- "d0301_run_birth_death   Simple birth-death difference equation model"
  cat(tmp, file = file.path(package_name, "demo", "00Index"))
  usethis::ui_done(paste("Writing", usethis::ui_value("00Index")))

  # Write function
  tmp <- system.file("dummy_package/step_birth_death.R", package = "RPiR")
  file.copy(tmp, file.path(package_name, "R", "step_deterministic_birth_death.R"))
  usethis::ui_done(paste("Writing", usethis::ui_value(basename(tmp))))

  # Write package file
  tmp <- system.file("dummy_package/package0301-package.R", package = "RPiR")
  file.copy(tmp, file.path(package_name, "R", basename(tmp)))
  usethis::ui_done(paste("Writing", usethis::ui_value(basename(tmp))))

  # Add dependency on dplyr
  current_wd <- getwd()
  setwd(package_dir)
  usethis::use_package("dplyr", "Imports")
  setwd(current_wd)

  # Document package
  devtools::document(package_name, quiet = TRUE)
  usethis::ui_done("Documenting package functions")
}
