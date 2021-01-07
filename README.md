# progInR
[![test-build](https://github.com/IBAHCM/RPiR/workflows/build/badge.svg?=1)](https://github.com/IBAHCM/RPiR/actions)

To install this package:
```
install.packages(c("devtools", "learnr"))
library(devtools)
install_github("IBAHCM/RPiR")
```

To run a practical, you first need to load up the learnr package:
```
library(learnr)
run_tutorial("practical1-1", package = "RPiR")
```

To reset a tutorial page, click on the Start Over link (look for the tiny grey text below the left menu). 

The following tutorials are included in this package:

* `practical1-1`: Exponential growth model; Writing scripts and commenting code
* `practical1-2`: Exponential growth model; Writing functions
* `practical1-3`: Exponential growth model; Sourcing code
* `practical1-4`: Exponential growth model; Generalising and structuring code
* `practical1-5`: Births and deaths model; Generalising code
* `practical1-6`: Births and deaths model; Writing reports in RStudio
* `practical2-1`: SIS model; Adapting previous code
* `practical2-2`: SIS model; Changing the timestep
* `practical2-3`: SIS model; Using while() loops
* `practical2-4`: SIR model; Adapting previous code
* `practical3-1`: Stochastic population growth model; Using stop()
* `practical3-2`: Stochastic births and deaths model; Passing functions as arguments
* `practical3-3`: Stochastic SIS model
* `practical3-4`: Stochastic SIR model
* `practical3-5`: Compare the mean stochastic model to the deterministic SIR model
* `practical4-1`: Biodiversity; Writing a data package
* `practical4-2`: Biodiversity; Writing a package demo
* `practical4-3`: Biodiversity; Adding package functions and documentation
