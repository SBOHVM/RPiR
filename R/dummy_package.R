#' dummy_package
#'
#' This function will create an RStudio project and
#' populate it with `0105-run-birth-death.R` (now `run-birth-death.R`), and
#' `0105-step-birth-death.R` (now `step_deterministic_birth_death.R`).
#'
#' @param package_name a \code{string} corresponding to the name you want to
#' give your package; this should be your GitHub user name.
#'
dummy_package <- function(package_name) {

  if (file.exists(package_name))
    stop("This directory already exists.")

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

  # Write githubusername-package file
  filename <- paste0(package_name, "-package.R")
  filepath <- file.path(package_name, "R", filename)
  cat(paste0("#' ", package_name), file = filepath)
  tmp <- list("\n#'",
              paste0("\n#' \\code{", package_name,
                     "} is a dummy package containing a simple birth-death"),
              "\n#' difference equation model.",
              "\n#'",
              "\n#' @author",
              "\n#' Sonia Mitchell <sonia.mitchell@glasgow.ac.uk> (maintainer) \\cr",
              "\n#' Richard Reeve <richard.reeve@glasgow.ac.uk>",
              "\n#'",
              paste0("\n#' @name ", package_name, "-package"),
              paste0("\n#' @aliases ", package_name),
              "\n#' @docType package",
              "\n#'",
              "\n#' @import RPiR",
              "\n#'",
              "\n#' @examples",
              "\n#' \\dontrun{",
              "\n#' # To run the demo",
              paste0("\n#' demo(\"d0301_run_birth_death\", package = \"",
                     package_name, "\")"),
              "\n#' }",
              "\n#'",
              "\nNULL",
              "\n")
  lapply(tmp, function(x) cat(x, file = filepath, append = TRUE))
  usethis::ui_done(paste("Writing", usethis::ui_value(filename)))

  # Add dependency on dplyr
  withr::with_dir(package_dir,
                  usethis::use_dev_package("RPiR", remote = "IBAHCM/RPiR"))

  # Document package
  devtools::document(package_name, quiet = TRUE)
  usethis::ui_done("Documenting package functions")
}
