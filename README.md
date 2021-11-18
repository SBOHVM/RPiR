# Reproducible Programming in R course (2020/21)

[![](https://img.shields.io/badge/docs-RPIR-blue)][docs]
[![test-build](https://github.com/IBAHCM/RPiR/workflows/R-CMD-check/badge.svg?=1)](https://github.com/IBAHCM/RPiR/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/IBAHCM/RPiR/badge)](https://www.codefactor.io/repository/github/IBAHCM/RPiR)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3+-brightgreen)](https://opensource.org/licenses/GPL-3.0)

## Course preparation

You'll need to do a few things before you can start the course. The details are
available in the guide section of the [docs][docs] under
[Course preparation][prep].

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

You can also see the lectures on the [GitHub website][docs] using the lecture
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

2. Practical series 2:

   * `practical2-1`: Creating an RStudio project
   * `practical2-2`: SIS model; Adapting previous code
   * `practical2-3`: SIS model; Changing the timestep
   * `practical2-4`: SIS model; Using while() loops
   * `practical2-5`: SIR model; Adapting previous code

3. Practical series 3:

   * `practical3-1`: Writing an R package
   * `practical3-2`: Simple stochastic birth-death model; Using stop()
   * `practical3-3`: Stochastic birth-death model; Passing functions as arguments
   * `practical3-4`: Stochastic SIS model
   * `practical3-5`: Stochastic SIR model
   * `practical3-6`: Comparing mean stochastic and deterministic SIR models

As well as the following additional practicals:

* `practicalA-1`: Introduction to for loops and functions
* `practicalA-2`: Tests and more loops

**NB** In Practical 1-6, we refer to the example notebook
`0200-example-notebook.R`. This can be found on Moodle, but it is also inside
the package at the location returned by the following command if you prefer:

```{R}
system.file("dummy_notebook/0200-example-notebook.R", package="RPiR")
```

[prep]: https://ibahcm.github.io/RPiR/articles/pages/preparation.html
[docs]: https://ibahcm.github.io/RPiR
