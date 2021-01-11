#' dummy_project
#'
#' This function will create an RStudio project called `project0201` and
#' populate it with `0105-run-birth-death.R` and `0105-step-birth-death.R`.
#'
#' @export
#'
dummy_project <- function() {

  path <- "project0201"

  # Create a new directory named "project0201" (will return a warning if
  # directory already exists)
  dir.create(path)

  # Populate "project0201"
  files <- c("dummy_project/0105-run-birth-death.R",
             "dummy_project/0105-step-birth-death.R")

  for (i in files) {
    tmp <- system.file(i, package = "RPiR")
    file.copy(tmp, file.path(path, basename(tmp)))
  }

  # Create an RStudio project named "project0201" and open it in a new instance
  # of RStudio (working directory will now be "project0201")
  usethis::proj_activate(path)
}
