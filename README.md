# Reproducible Programming in R course
[![](https://img.shields.io/badge/docs-RPIR-blue)][docs]
[![test-build](https://github.com/IBAHCM/RPiR/workflows/R-CMD-check/badge.svg?=1)](https://github.com/IBAHCM/RPiR/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/IBAHCM/RPiR/badge)](https://www.codefactor.io/repository/github/IBAHCM/RPiR)
[![License: GPL-3.0](https://img.shields.io/badge/licence-GPL--3)](https://opensource.org/licenses/GPL-3.0)

## Course preparation

You'll need to do a few things before we can start the course. These are
detailed in the documentation for this package under the `Installation`
dropdown men at [![](https://img.shields.io/badge/docs-RPIR-blue)][docs]:

1. First install the RPiR package - [instructions here][package].
2. Then create a github account and connect it to
   RStudio - [instructions here][github]. This will also show you how to create
   a practice project on github. You'll use this in the second practical series,
   but it's worth trying out the instructions now to check that everything is
   working.
3. Finally, install Microsoft VSCode (aka Visual Studio Code) and then Live
   Share - [instructions here][vscode]. You will need your GitHub id from the
   previous step to do this.

## Running the course

To start the course, load the `RPiR` package:

```
library(RPiR)
```

You can then see what lectures and practicals are available using:

```
available_lectures()
available_practicals()
```

## Practicals

**To run a practical**, use the `run_practical()` function in RStudio. For
example, `run_practical("practical1-1")` will run the first practical.

> When you run a practical, you will not be able to use the R console until you
  close it, so we suggest that you open a separate instance of RStudio to run
  any code, so one RStudio is dedicated to running practicals and lectures.

**To reset a practical** if you want to start again, click on the Start Over
link (look for the tiny grey  text below the left menu). 

**To close a practical** when you have finished it, close the webpage in your
web browser, then either hit `escape` or click on the red STOP button 
in RStudio to end the process.

## Lectures

**To view lecture slides**, use the `run_lecture()` function in RStudio. For
example, `run_lecture("RPiR1-1")` will show the first lecture slides.

You can also see the lectures on the [GitHub website][docs] using the lecture
dropdown menus, either as slides (under `Lectures (slides)`) or as single
continuous documents for later reference (under `Lectures (html)`).

## Course contents

The following practicals are included in this package:

* `practical1-1`: Exponential growth model; Writing scripts and commenting code
* `practical1-2`: Exponential growth model; Writing functions
* `practical1-3`: Exponential growth model; Sourcing code
* `practical1-4`: Exponential growth model; Generalising and structuring code
* `practical1-5`: Births and deaths model; Generalising code
* `practical1-6`: Births and deaths model; Writing reports in RStudio
* `practical2-1`: Creating an RStudio project
* `practical2-2`: SIS model; Adapting previous code
* `practical2-3`: SIS model; Changing the timestep
* `practical2-4`: SIS model; Using while() loops
* `practical2-5`: SIR model; Adapting previous code
* `practical3-1`: Writing an R package
* `practical3-2`: Stochastic population growth model; Using stop()
* `practical3-3`: Stochastic births and deaths model; Passing functions as arguments
* `practical3-4`: Stochastic SIS model
* `practical3-5`: Stochastic SIR model
* `practical3-6`: Compare the mean stochastic model to the deterministic SIR model
* `practical4-1`: Biodiversity; Writing a data package
* `practical4-2`: Biodiversity; Writing a package demo
* `practical4-3`: Biodiversity; Adding package functions and documentation

[docs]: https://ibahcm.github.io/RPiR
[package]: https://ibahcm.github.io/RPiR/articles/pages/install_RPiR.html
[github]: https://ibahcm.github.io/RPiR/articles/pages/github.html
[vscode]: https://ibahcm.github.io/RPiR/articles/pages/vscode_liveshare.html
