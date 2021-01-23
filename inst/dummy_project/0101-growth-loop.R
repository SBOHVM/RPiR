#' ---
#' title: "Simple growth difference equation model"
#' author: "Richard Reeve"
#' date: "9th Jan 2018"
#' output: html_document
#' ---

#' File: 0101-growth-loop.r
#' ========================
#'
#' Set up the simulation parameters
#' --------------------------------
#' First we set up the parameters for the simulation.

# Set the growth rate
growth.rate <- 0.015

# Starting population size
initial.count <- 7000000000

# And setting times
start.time <- 0
end.time <- 100

#' Run the simplest possible simulation
#' ------------------------------------
#' Then we run it so that we can get the output we need.

# Set up the population starting size (at the first timestep)
population.vector <- c(initial.count)

# the timesteps that the simulation will run through
timesteps <- seq(from = start.time + 1, to = end.time)

# Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps) {
  # First extract the current population size
  current.population <- tail(population.vector, 1)

  # Calculate changes to population
  new.additions <- growth.rate * current.population

  # Calculate population at next timestep
  next.population <- current.population + new.additions

  # Add new element onto end of population vector
  population.vector <- append(population.vector, next.population)
}

#' Plot the results
#' ----------------
#' And finally we output the results.

plot(append(start.time, timesteps), population.vector, type = "l")
abline(h = initial.count * 2, lty = 2, col = 2)
abline(v = 46.6, lty = 2, col = 2)
abline(h = initial.count * 4, lty = 2, col = 3)
abline(v = 46.6 * 2, lty = 2, col = 3)
