#' ---
#' title: "Simple growth difference equation model"
#' author: "Richard Reeve"
#' date: "9th Jan 2018"
#' output: html_document
#' ---

#' ### Function: step_deterministic_growth()

#' Run one step of a simple deterministic exponential growth model.
#'
#' #### Arguments:
#'
#' - latest -- a data frame containing the latest population count
#'             (column is 'count')
#' - growth.rate -- the growth rate
#'
#' #### Returns:
#'
#' - a data.frame containing the updated population
step_deterministic_growth <- function(latest, growth.rate)
{
  ## Calculate population changes
  new.additions <- growth.rate * latest$count

  next.count <- latest$count + new.additions

  ## Return data frame containing next population count
  data.frame(count=next.count)
}

#' #### Does the function works without any external (global) information?

library(codetools)
if (length(findGlobals(step_deterministic_growth, merge=FALSE)$variables) != 0)
{
  stop("Function step_deterministic_growth() may not use global variable(s): ",
       findGlobals(step_deterministic_growth, merge=FALSE)$variables)
}
