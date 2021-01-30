#' step_deterministic_birth_death
#'
#' Run one step of a simple deterministic exponential birth-death model
#'
#' @param latest a data.frame containing the latest population count
#' (column is 'count')
#' @param birth.rate the birth rate
#' @param death.rate the death rate
#'
#' @return Returns a data.frame containing the updated population
#' @export
#'
step_deterministic_birth_death <- function(latest, birth.rate, death.rate) {
  # Calculate population changes
  new.births <- birth.rate * latest$count
  new.deaths <- death.rate * latest$count
  next.count <- latest$count + new.births - new.deaths

  # Return data frame containing next population count
  data.frame(count = next.count)
}
