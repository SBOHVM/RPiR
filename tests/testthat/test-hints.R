# Preload functions
functions <- c("0103-step-simple-growth.R",
               "0104-step-growth.R",
               "0105-step-birth-death.R")
lapply(functions, function(x) 
  source(system.file(file.path("dummy_project", x), package = "RPiR")))

# Preload objects
growth.rate <- 0.015
initial.count <- 7000000000
population.vector <- initial.count

# Find Practicals
practicals <- list.dirs("inst/tutorials", full.names = TRUE, recursive = FALSE)

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
