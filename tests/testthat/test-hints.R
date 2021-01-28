# This test finds all -hint chunks in the RPiR package and tests whether the
# code works or not. If you're finding this test is failing and you've recently
# added a -hint chunk, it might mean that the test is missing some function or 
# object that is required by your -hint chunk and hasn't been pre-loaded. 
# Please add them below.

# Pre-load functions and objects required to run -hint code chunks --------

functions <- c("0103-step-simple-growth.R",
               "0104-step-growth.R",
               "0105-step-birth-death.R")
lapply(functions, function(x) 
  source(system.file(file.path("dummy_project", x), package = "RPiR")))

growth.rate <- 0.015
initial.count <- 7000000000
population.vector <- initial.count

# Find Practicals ---------------------------------------------------------

practicals <- list.dirs("inst/tutorials", full.names = TRUE, recursive = FALSE)

# Extract hint chunks, then run them (and expect no error) ----------------

for (i in seq_len(length(practicals))) {
  # Extract hint chunks
  filename <- dir(practicals[i], ".Rmd", full.names = TRUE)
  chunks <- RPiR:::extract_chunks(filename)
  index <- grep("-hint$", names(chunks))
  hints <- chunks[index]
  
  # Run hint chunks and expect no error
  for (j in seq_len(length(hints))) {
    testthat::expect_error(
      eval(parse(text = hints[[j]])), NA
    )
  }
}
