# Reproducible Programming in R course (2022/23)

[![](https://img.shields.io/badge/docs-RPIR-blue)][docs]
[![test-build](https://github.com/SBOHVM/RPiR/workflows/R-CMD-check/badge.svg?=1)](https://github.com/SBOHVM/RPiR/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/SBOHVM/RPiR/badge)](https://www.codefactor.io/repository/github/SBOHVM/RPiR)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3+-brightgreen)](https://opensource.org/licenses/GPL-3.0)

## Course preparation

There are a few things to do before you can start the course.
The details are available in the Guides section of the
[website][docs] under Course preparation.

## Running the course

To start the course, load the `RPiR` package:

```{R}
library(RPiR)
```

You can then see what lectures and practicals are available using:

```{R}
available_lectures()
available_practicals()
```

In RStudio, you can also open *Preferences...*, choose *Pane Layout*, and
tick the box for *Tutorial* and click *OK*. Once you have done this, you
should find you have a *Tutorial* pane in RStudio, you can then browse all of
the practicals that you have installed there.

## Practicals

**To run a practical**, you can click *Start Tutorial* from the *Tutorial
pane* in RStudio. You can then run the practical inside that RStudio pane, or
click the *Show in new window* icon in the top left to open it in a larger
separate window (you can open multiple practicals simultaneously like this).
Alternatively, you can use the `run_practical()` function in the *Console
pane*. For example, `run_practical("practical1-1")` will run the first
practical of practical series 1. 

> If you decide to run a practical like this, you will not be able to use the R
  console until you close it, so we suggest that you open a separate instance of
  RStudio to run any code, so one RStudio is dedicated to running practicals and
  lectures.

**To reset a practical** if you want to start again, click on the Start Over
link (look for the tiny grey text below the left menu), which appears if you
are not running this inside the Tutorial pane.

**To close a practical if you opened it from the Tutorial pane** when you have
finished it, click on the red STOP button in the *Tutorial* pane or close the
separate window. Clicking instead on the *Home* icon will return to the
practical list, but you can resume the practical from where you left off by
restarting it.

**To close a practical if you opened it from the Console pane** when you have
finished it, close the webpage in your web browser, then either hit `escape` or
click on the red STOP button in the RStudio *Console* to end the process.

**If you are having problems with the practicals running correctly**, try
running `RPiR:::clean_cached_exercises()` in the *Console* pane to force the
practicals to be rebuilt.

You can also browse the non-interactive practicals on the GitHub website
(under `Practicals (html)`).

## Lectures

**To view lecture slides**, use the `run_lecture()` function in RStudio. For
example, `run_lecture("RPiR1-intro")` will show the first lecture slides.

You can also see the lectures on the course [website][docs] using the lecture
dropdown menus, either as slides (under `Lectures (slides)`) or as single
continuous documents for later reference (under `Lectures (html)`).

## Course contents

The following core practicals are included in this package:

1. Practical series 1:

   * `practical1-1`: Exponential growth model; Writing scripts and commenting code
   * `practical1-2`: Exponential growth model; Writing functions
   * `practical1-3`: Exponential growth model; Sourcing code
   * `practical1-4`: Exponential growth model; Generalising and structuring code
   * `practical1-5`: Births and deaths model; Generalising code
   * `practical1-6`: Births and deaths model; Writing reports in RStudio

2. Practical series 2:

   * `practical2-1`: SIS model; Adapting previous code
   * `practical2-2`: SIS model; Changing the timestep
   * `practical2-3`: SIS model; Using while() loops
   * `practical2-4`: SIR model; Adapting previous code

3. Practical series 3:

   * `practical3-1`: Writing an R package
   * `practical3-2`: Simple stochastic birth-death model; Using stop()
   * `practical3-3`: Stochastic birth-death model; Passing functions as arguments
   * `practical3-4`: Stochastic SIS model
   * `practical3-5`: Stochastic SIR model
   * `practical3-6`: Comparing mean stochastic and deterministic SIR models

4. Practical series 4:

   * `practical4-1`: Creating an R data package
   * `practical4-2`: Adding some fucntions to a data package
   * `practical4-3`: Adding a demo
   
5. Project:

   * `project0`: Setting up the project repo
   * `project1`: Creating species richness and Simpson diversity functions
   * `project2`: Creating a general diversity function
   * `project3`: Adding in code to cope with Shannon entropy and Berger-Parker
   * `project4`: Adjusting the diversity function to handle multiple values of q
   * `project5`: Extending the work to examine properties of subsampled data

As well as the following additional practicals:

   * `practicalA-1`: Introduction to if statements and comparisons
   * `practicalA-2`: Introduction to functions
   * `practicalA-3`: Naming of things
   * `practicalA-4`: Introduction to for and while loops
   * `practicalA-5`: Nested functions

[prep]: https://sbohvm.github.io/RPiR/articles/pages/preparation.html
[docs]: https://sbohvm.github.io/RPiR
