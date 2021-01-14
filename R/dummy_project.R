#' dummy_project
#'
#' This function will create an RStudio project called `project0201` and
#' populate it with `0105-run-birth-death.R` and `0105-step-birth-death.R`.
#'
#' @export
#'
dummy_project <- function() {

  path <- "project0201"

  if (file.exists(path))
    stop("This directory already exists.")

  # Create a new directory named "project0201" (will return a warning if
  # directory already exists)
  dir.create(path)
  usethis::ui_done(paste("Creating", usethis::ui_path(path)))

  # Populate "project0201"
  files <- c("dummy_project/0105-run-birth-death.R",
             "dummy_project/0105-step-birth-death.R")

  for (i in files) {
    tmp <- system.file(i, package = "RPiR")
    save_as <- gsub("01", "02", basename(tmp))
    file.copy(tmp, file.path(path, save_as))
    usethis::ui_done(paste("Writing", usethis::ui_value(save_as)))
  }

  # Create an RStudio project named "project0201" and open it in a new instance
  # of RStudio (working directory will now be "project0201")
  usethis::proj_activate(path)
}
