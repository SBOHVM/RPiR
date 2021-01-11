#' Simple birth-death difference equation model

### File: 0105-run-birth-death.r

#' Load in the functions that do the work
library(ProgInR)
source("0105-step-birth-death.r")

#' Set up the simulation parameters

# Set the birth and death rates
birth.rate <- 0.2
death.rate <- 0.1

# Starting population size
initial.count <- 1

# And setting times
start.time <- 0
end.time <- 100

#' Run the simulation

## Set up the population starting size (at the first timestep)
population.df <- data.frame(count = initial.count)

## the timesteps that the simulation will run through
timesteps <- seq(from = start.time + 1, to = end.time)

## Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps) {
  updated.population <- step_deterministic_birth_death(latest = tail(population.df, 1),
                                                       birth.rate = birth.rate,
                                                       death.rate = death.rate)
  population.df <- rbind(population.df, updated.population)
}

#' And plot the results
population.df$time <- c(start.time, timesteps)
plot_populations(population.df)
