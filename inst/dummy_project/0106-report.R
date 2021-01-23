#' ---
#' author: Richard Reeve
#' title: Comparing a simple growth model with a birth-death model
#' ---
#'
#' ## File: 0106-report.r

#'
#' Load in the functions that do the work
library(ProgInR)
source("0104-step-growth.r")
source("0105-step-birth-death.r")

#' First we set up the simulation parameters for every experiment.

## Set the birth and death rates
birth.rate <- 0.2
death.rate <- 0.1

## Starting population size
initial.count <- 1

## And setting times
start.time <- 0
end.time <- 100

## the timesteps that the simulation will run through
timesteps <- seq(from=start.time + 1, to=end.time)

#'
#' ## Run the full $birth, death$ simulation

## Set up the population starting size (at the first timestep)
population.df1 <- data.frame(count=initial.count)

## Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps)
{
  updated.population <- step_deterministic_birth_death(latest=tail(population.df1, 1),
                                                       birth.rate=birth.rate,
                                                       death.rate=death.rate)
  population.df1 <- rbind(population.df1, updated.population)
}
population.df1$time <- c(start.time, timesteps)

plot_populations(population.df1)

#'
#' ## Compare that to the $growth=birth$ simulation

## Set up the population starting size (at the first timestep)
population.df <- data.frame(count=initial.count)

## Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps)
{
  updated.population <- step_deterministic_growth(latest=tail(population.df, 1),
                                                  growth.rate=birth.rate)
  population.df <- rbind(population.df, updated.population)
}
population.df$time <- c(start.time, timesteps)

plot_populations(population.df1, with.legend=FALSE)
plot_populations(population.df, new.graph=FALSE, col=2)
legend("topleft", legend=c("birth, death", "growth = birth"),
       col=c(1, 2), lty=c(1, 1), cex=0.7)

#' Growth that only accounts for birth without death causes the population to
#' grow too fast (unsurprisingly).
#'
#' ## Compare it to the $growth=-death$ simulation

## Set up the population starting size (at the first timestep)
population.df <- data.frame(count=initial.count)

## Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps)
{
  updated.population <- step_deterministic_growth(latest=tail(population.df, 1),
                                                  growth.rate=-death.rate)
  population.df <- rbind(population.df, updated.population)
}
population.df$time <- c(start.time, timesteps)

plot_populations(population.df1, with.legend=FALSE)
plot_populations(population.df, new.graph=FALSE, col=2)
legend("topleft", legend=c("birth, death", "growth = -death"),
       col=c(1, 2), lty=c(1, 1), cex=0.7)

#' Growth that only accounts for death on its own just kills off the population!
#'
#' ## And finally compare it to the $growth=birth-death$ simulation

## Set up the population starting size (at the first timestep)
population.df <- data.frame(count=initial.count)

## Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps)
{
  updated.population <- step_deterministic_growth(latest=tail(population.df, 1),
                                                  growth.rate=birth.rate-death.rate)
  population.df <- rbind(population.df, updated.population)
}
population.df$time <- c(start.time, timesteps)

plot_populations(population.df1, with.legend=FALSE)
plot_populations(population.df, new.graph=FALSE, col=2, lty=2)
legend("topleft", legend=c("birth, death", "growth = birth - death"),
       col=c(1, 2), lty=c(1, 2), cex=0.7)

#' Now we can see that the full $birth, death$ model looks exactly the
#' same as the population growth model with $growth = birth - death$
#' (i.e. the black and dashed red lines are on top of each other).
