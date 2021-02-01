#' ---
#' title: "The title --- example notebook"
#' author: "A. N. Other"
#' date: '`r format(Sys.Date(), "%B %d %Y")`'
#' output: html_document
#' ---

#' Extra commands:
#'
#' - output: pdf_document
#' - output: html_document
#'
#' allow you to lock in the pdf or html format so you don't need to click
#' when you build the notebook.
#'
#' Also note that three dashes --- gives a long text dash, as above,
#' and two dashes -- give a shortish one. You probably only want to
#' use one - to mean minus.

#'
#' Biggest Header
#' ==============

#' You can write any text you like after the #\' comment characters to describe
#' your program. If you're using *RStudio*, you can just press *Enter* every
#' time you get to the dotted vertical line in the window so that your R text
#' doesn't scroll off the page unnecessarily. You automatically get the right
#' comment characters so you can just carry on typing. However, there are lots
#' of things you can do to format the text.
#'
#' For instance, you can *italicise* and **bold** text easily if you want to.
#' Information on the some of the basic rules for writing text (not R) is at
#' http://daringfireball.net/projects/markdown/syntax though most stuff is
#' explained below too. This format is called **Markdown**, and it describes
#' everything that happens after the #\' symbols, though those symbols are
#' nothing to do with markdown, they are just how to get *Markdown* into *R*.
#'
#' You need to press enter twice to start a new paragraph, and when you're
#' starting a new style of text, like a list or a header you need to have a
#' blank comment line before it to make sure that the words don't appear in the
#' previous paragraph by accident

#'
#' A list: second level header
#' ---------------------------

#' 1. Lists are started by numbers (note that any number will do) or -, + or *
#' 1. Write an equation using $ lhs = rhs $ with no space after the first $
#' 1. For instance:
#'      - $D = sin(q)$
#'      - $E = sin(q/10)$
#' 4. Note that you need three tabs to have a sub-list as above.
#'

#' ## A different second level: actually doing some R!

x <- 2
y <- (3 + x)^2
## R comments just appear as normal
y
## Note that outputs appear with ## before them for some reason!

#' Comments can also include R, so $y = (3+x)^2$ =
{{y}}
#' gives you the number calculated in R.

#'
#' ### Now some simple figures: third level header
q <- 0:100
D <- sin(q)
plot(q, D)

#' ### And a sub-figure of a specific size
#'
#+ fig.width=5, fig.height=5, fig.cap="Figure 2: some sine curves"
E <- sin(q/10)
plot(q, E, type='l')
lines(q, D, col=2, lty=2)
#' Sadly, figure and other options are poorly documented,
#' but we've provided some help sheets if you want to use them (not compulsory!)
#'
#' __________________________________________
#'
#' # Now some more complex (optional) maths

n <- 5
x = rnorm(n)
mean(x)
var(x)

## Here we calculate a couple of simple equations using the data
## We want to stop writing out the strange ## code before outputs
#+ comment=""
sum(x) / n
sum((x - mean(x))^2) / (n - 1)

#' And here are the equations we just calculated written out neatly:
#'
#' - mean(x) = $1/n \sum_{i=1}^n x_i$
#' - and for a bigger equation on its own line:
#' $$var(x) = \frac{1}{n-1} \sum_{j=1}^n (x_j - \frac{\sum_{i=1}^n x_i}{n})^2$$
#' $$\sum_{i=1}^n x_i$$
#'
#' We can also write stuff in greek and with accents if we need to:
#'
#' - $\hat{\gamma} = \bar{\alpha} \times \ddot{\beta}$
#'
#' Note that this complex syntax for equations is LaTeX -- or \LaTeX\ as
#' it's officially written -- if you haven't seen it before, you don't need
#' to use it, but there is lots of information here on writing formulae at
#' https://en.wikibooks.org/wiki/LaTeX/Mathematics, and there are some specific
#' things you can put in a formula
#' [here](https://en.wikipedia.org/wiki/Help:Displaying_a_formula#Formatting_using_TeX).
#'

## Note that the uncommented output stops after the next text block
mean(x) / var(x)
