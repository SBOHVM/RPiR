#' ---
#' title: "Simple growth difference equation model"
#' author: "Richard Reeve"
#' date: "9th Jan 2018"
#' output: html_document
#' ---

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

#' Now check that step_simple_growth() doesn't have any global variables.
library(codetools)
if (length(findGlobals(step_simple_growth, merge=FALSE)$variables) != 0)
{
  stop("Function step_simple_growth() may not use global variable(s): ",
       findGlobals(step_simple_growth, merge=FALSE)$variables)
}
