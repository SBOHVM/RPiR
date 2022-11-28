#' ---
#' title: "Simple birth-death difference equation model"
#' author: "Richard Reeve"
#' date: '`r format(Sys.Date(), "%B %d %Y")`'
#' output: html_document
#' ---

#'
#' ### Function: step_deterministic_birth_death() - A simple deterministic exponential birth-death model
#'
#' Run one step of a simple deterministic exponential birth-death model
#'
#' Arguments:
#'
#' - latest -- a data frame containing the latest population count
#'             (column is 'count')
#'
#' - birth.rate -- the birth rate
#'
#' - death.rate -- the death rate
#'
#' Returns:
#'
#' - a data.frame containing the updated population
#'
step_deterministic_birth_death <- function(latest, birth.rate, death.rate) {

  ## Calculate population changes
  new.births <- birth.rate * latest$count
  new.deaths <- death.rate * latest$count

  next.count <- latest$count + new.births - new.deaths

  ## Return data frame containing next population count
  data.frame(count = next.count)
}

#' #### Does the function works without any external (global) information?

library(codetools)
if (length(findGlobals(step_deterministic_birth_death,
                       merge = FALSE)$variables) != 0) {
  stop(
    "Function step_deterministic_birth_death() may not use global variable(s): ",
    findGlobals(step_deterministic_birth_death, merge = FALSE)$variables
  )
}
