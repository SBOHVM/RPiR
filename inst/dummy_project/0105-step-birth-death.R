#### Simple birth-death difference equation model
#### --------------------------------------------
### File: 0105-step-birth-death.r

### step_deterministic_birth_death
### ------------------------------
## Run one step of a simple determinstic exponential birth-death model

## Arguments:
##  - latest - a data.frame containing the latest population count
##             (column is 'count')
##  - birth.rate - the birth rate
##  - death.rate - the death rate

## Returns:
##  - a data.frame containing the updated population
step_deterministic_birth_death <- function(latest, birth.rate, death.rate) {
  ## Calculate population changes
  new.births <- birth.rate * latest$count
  new.deaths <- death.rate * latest$count

  next.count <- latest$count + new.births - new.deaths

  ## Return data frame containing next population count
  data.frame(count = next.count)
}
