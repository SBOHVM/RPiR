#' Reproducible Programming in R course -
#'
#' \code{RPiR} is a learnr implementation of the Reproducible Programming
#' in R course, developed by the Institute of Biodiversity, Animal Health, and
#' Comparative Medicine at the University of Glasgow.
#'
#' To run a practical, you first need to load up the learnr package (see
#' Examples). To reset a practical, click on the Start Over link (look for the
#' tiny grey text below the left menu). To close a practical, close the window,
#' then click on the red STOP button in RStudio to end the process.
#'
#' The following tutorials are included in this package:
#' \itemize{
#' \item 0-1: Introduction to for loops and functions
#' \item 1-1 Exponential growth model; Writing scripts and commenting code
#' \item 1-2 Exponential growth model; Writing functions
#' \item 1-3 Exponential growth model; Sourcing code
#' \item 1-4 Exponential growth model; Generalising and structuring code
#' \item 1-5 Births and deaths model; Generalising code
#' \item 1-6 Births and deaths model; Writing reports in RStudio
#' \item 2-1 Creating an RStudio project
#' \item 2-2 SIS model; Adapting previous code
#' \item 2-3 SIS model; Changing the timestep
#' \item 2-4 SIS model; Using while() loops
#' \item 2-5 SIR model; Adapting previous code
#' \item 3-1 Writing an R package
#' \item 3-2 Stochastic population growth model; Using stop()
#' \item 3-3 Stochastic births and deaths model; Passing functions as arguments
#' \item 3-4 Stochastic SIS model
#' \item 3-5 Stochastic SIR model
#' \item 3-6 Compare the mean stochastic model to the deterministic SIR model
#' \item 4-1 Biodiversity; Writing a data package
#' \item 4-2 Biodiversity; Writing a package demo
#' \item 4-3 Biodiversity; Adding package functions and documentation
#' }
#'
#' For more information go to our GitHub page;
#' \url{https://github.com/IBAHCM/RPiR}
#'
#' Please raise an issue if you find any problems;
#' \url{https://github.com/IBAHCM/RPiR/issues}
#'
#' @author
#' Sonia Mitchell <sonia.mitchell@glasgow.ac.uk> (maintainer) \cr
#' Richard Reeve <richard.reeve@glasgow.ac.uk>
#'
#' @name RPiR-package
#' @aliases RPiR
#' @docType package
#'
#' @import codetools
#' @import datasets
#' @import deSolve
#' @import devtools
#' @import dplyr
#' @import ggplot2
#' @rawNamespace import(gradethis, except = c(random_praise, random_encouragement))
#' @import graphics
#' @import knitr
#' @import learnr
#' @import rlang
#' @import rmarkdown
#' @import rstudioapi
#' @import usethis
#' @import utils
#' @importFrom withr with_dir
#'
#' @examples
#' \dontrun{
#' # To run a tutorial
#' RPiR::run_practical("practical1-1")
#' }
#'
NULL
