#' populate_package
#'
#' This function will create an RStudio project and populate it with
#' `0105-run-birth-death.R`, and `0105-step-birth-death.R`.
#'
#' @export
#'
populate_package <- function() {
  project_name <- rstudioapi::getActiveProject()
  if (is.null(project_name))
    stop("You are not in an active RStudio project, please create one first")
  package_name <- basename(project_name)

  # Remove R/hello.R
  unlink("R/hello.R")
  unlink("man/hello.Rd")
  unlink("NAMESPACE")

  # Create demo/ directory
  dir.create("demo")
  usethis::ui_done(paste("Creating", usethis::ui_path("demo")))

  # Write demo
  filepath <- file.path("demo", "d0105_run_birth_death.R")
  cat("#' # Simple birth-death difference equation model",
      file = filepath)
  tmp <- list("\n",
              "\nlibrary(RPiR)",
              paste0("\nlibrary(", package_name, ")"),
              "\n#' Set up the simulation parameters",
              "\n# Set the birth and death rates",
              "\nbirth.rate <- 0.2",
              "\ndeath.rate <- 0.1",
              "\n",
              "\n# Starting population size",
              "\ninitial.count <- 1",
              "\n",
              "\n# And setting times",
              "\nstart.time <- 0",
              "\nend.time <- 100",
              "\n",
              "\n#' Run the simulation",
              "\n",
              "\n## Set up the population starting size (at the first timestep)",
              "\npopulation.df <- data.frame(count = initial.count)",
              "\n",
              "\n## the timesteps that the simulation will run through",
              "\ntimesteps <- seq(from = start.time + 1, to = end.time)",
              "\n",
              "\n## Now we loop through the time itself (starting at the second timestep)",
              "\nfor (new.time in timesteps) {",
              "\n  updated.population <-",
              "\n    step_deterministic_birth_death(latest = tail(population.df, 1),",
              "\n                                   birth.rate = birth.rate,",
              "\n                                   death.rate = death.rate)",
              "\n  population.df <- rbind(population.df, updated.population)",
              "\n}",
              "\n",
              "\n#' And plot the results",
              "\npopulation.df$time <- c(start.time, timesteps)",
              "\nplot_populations(population.df)",
              "\n")
  lapply(tmp, function(x) cat(x, file = filepath, append = TRUE))
  usethis::ui_done(paste("Writing", usethis::ui_value("d0105_run_birth_death.R")))

  # Write demo index file
  tmp <- "d0105_run_birth_death   Simple birth-death difference equation model\n"
  cat(tmp, file = file.path("demo", "00Index"))
  usethis::ui_done(paste("Writing", usethis::ui_value("00Index")))

  # Write function
  tmp <- system.file("dummy_package/step_birth_death.R", package = "RPiR")
  file.copy(tmp, file.path("R", "step_birth_death.R"))
  usethis::ui_done(paste("Writing", usethis::ui_value(basename(tmp))))

  # Write githubusername-package file
  filename <- paste0(package_name, "-package.R")
  filepath <- file.path("R", filename)
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
              paste0("\n#' demo(\"d0105_run_birth_death\", package = \"",
                     package_name, "\")"),
              "\n#' }",
              "\n#'",
              "\nNULL",
              "\n")
  lapply(tmp, function(x) cat(x, file = filepath, append = TRUE))
  usethis::ui_done(paste("Writing", usethis::ui_value(filename)))

  # Add dependencies
  usethis::use_dev_package("RPiR", "Imports", remote = "IBAHCM/RPiR")
  usethis::use_package("dplyr", "Imports", min_version = NULL)

  # Document package
  devtools::document(quiet = TRUE)
  usethis::ui_done("Documenting package functions")
}
