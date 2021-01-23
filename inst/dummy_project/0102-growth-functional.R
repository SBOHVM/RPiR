#' ---
#' title: "Simple growth difference equation model"
#' author: "Richard Reeve"
#' date: "9th Jan 2018"
#' output: html_document
#' ---

#'
#' File: 0102-growth-functional.r
#' ------------------------------

#' First define the function that does the work.
#'
#' ### Function: step.simple.growth()

#' Run one step of a simple deterministic exponential growth model.
#'
#' #### Arguments:
#'
#' - current.population -- the population count now
#' - growth.rate -- the growth rate
#'
#' #### Returns:
#'
#' - the updated population count
step_simple_growth <- function(current.population, growth.rate)
{
  # Calculate changes to population
  new.additions <- growth.rate * current.population

  # Calculate population at next timestep
  next.population <- current.population + new.additions

  # Return updated population
  next.population
}

#' ### Now check the function works without any extra information
library(codetools)
findGlobals(step_simple_growth, merge=FALSE)

#' ### Now set up the simulation parameters
#' First we set up the parameters for the simulation.

# Set the growth rate for this specific problem
human.annual.growth <- 0.015

# Starting population size
initial.human.population <- 7*10^9

# And setting times
start.time <- 0
end.time <- 100

#' ### Run the simplest possible simulation
#' Then we run it so that we can get the output we need.

# Set up the population starting size (at the first timestep)
human.population.vector <- c(initial.human.population)

# the timesteps that the simulation will run through
timesteps <- seq(from=start.time + 1, to=end.time)

# Now we loop through the time itself (starting at the second timestep)
for (new.time in timesteps)
{
  updated.human.population <-
    step_simple_growth(current.population=tail(human.population.vector, 1),
                       growth.rate=human.annual.growth)
  human.population.vector <- append(human.population.vector,
                                    updated.human.population)
}

#' ### And plot the results
#' And finally we output the results.
plot(append(start.time, timesteps), human.population.vector, type='l')
abline(h = initial.human.population * 2, lty=2, col=2)
abline(v = 46.6, lty=2, col=2)
abline(h = initial.human.population * 4, lty=2, col=3)
abline(v = 46.6 * 2, lty=2, col=3)
#' Note the dashed lines show doubling of the population every 46.6 years.
