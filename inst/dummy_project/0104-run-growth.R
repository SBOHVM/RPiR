#' ---
#' title: "Simple growth difference equation script"
#' author: "Richard Reeve"
#' date: '`r format(Sys.Date(), "%B %d %Y")`'
#' output: html_document
#' ---

#' First load in the functions that do the work
library(RPiR)
source("0104-step-growth.R")

#' Set up the simulation parameters

## Set the growth rate to the stand human growth rate
human.growth <- 0.015

## Starting population size
initial.human.pop <- 7 * 10 ^ 9

## And setting times
start.time <- 0
end.time <- 100

#' Run the simplest possible simulation

## Set up the population starting size (at the first timestep)
population.df <- data.frame(count = initial.human.pop)

## the timesteps that the simulation will run through
timesteps <- seq(from = start.time + 1, to = end.time)

## Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps) {
  updated.population <-
    step_deterministic_growth(latest = tail(population.df, 1),
                              growth.rate = human.growth)
  population.df <- rbind(population.df, updated.population)
}

#' And plot the output
population.df$time <- c(start.time, timesteps)
plot_populations(population.df)
abline(h = initial.human.pop * 2, lty = 2, col = 2)
abline(v = 46.6, lty = 2, col = 2)
abline(h = initial.human.pop * 4, lty = 2, col = 3)
abline(v = 46.6 * 2, lty = 2, col = 3)

#' Note the dashed lines show doubling of the population every 46.6 years.
