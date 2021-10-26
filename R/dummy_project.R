#' dummy_project
#'
#' This function will create an RStudio project and
#' populate it with scripts from practical series 1.
#'
#' @param project_name a \code{string} corresponding to the name you want to
#' give your project; this should be your GitHub user name, followed by the
#' practical number, *e.g.* maryjane_0201
#'
dummy_project <- function(project_name) {

  if (file.exists(project_name))
    stop("This directory already exists.")

  # Create a new directory, project_name (will return a warning if
  # directory already exists)
  dir.create(project_name)
  usethis::ui_done(paste("Creating", usethis::ui_path(project_name)))

  # Populate project_name
  files <- system.file("dummy_project", package = "RPiR")
  files <- dir(files, full.names = TRUE)

  for (i in seq_len(length(files))) {
    filename <- basename(files[i])
    file.copy(files[i], file.path(project_name, filename))
    usethis::ui_done(paste("Writing", usethis::ui_value(filename)))
  }

  # Create an RStudio project, project_name, and open it in a new instance
  # of RStudio (working directory will now be project_name)
  usethis::proj_activate(project_name)
}
