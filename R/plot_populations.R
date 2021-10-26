#' @title Plot population(s) against time
#'
#' @description
#' Plot all of the populations in a data frame against time. One column must
#' be called "time" and will be used as the x-axis of the plot. The rest will
#' be used as different lines on the y-axis, with a legend denoting their
#' column names.
#'
#' @param populations Data frame with columns corresponding to different
#' population segments and a 'time' column
#' @param new.graph (optionally) whether to start a new graph, default TRUE
#' @param ylim (optionally, for new graphs) the limits of the y axis,
#' default min to max pop size
#' @param lty (optionally) the line type for the graph, default 1
#' @param col (optionally) the colour for all lines,
#' default 1:num.populations you can name these c(susceptibles = "green", ...)
#' @param with.legend (optionally) whether to include the legend (TRUE or
#' FALSE), default TRUE
#' @param ... (optionally) any other arguments that plot and lines will both
#' accept
#'
#' @export
#'
#' @examples
#' df <- data.frame(time = 0:100, grow = exp((0:100) / 10),
#'                  die = exp(seq(10, 0, by = -0.1)))
#' plot_populations(df, lty = 2, main = "A title")
#'
plot_populations <- function(populations, new.graph = TRUE, ylim = NA, lty = 1,
                             col = NA, with.legend = TRUE, ...) {
  if (any(colnames(populations) == "time")) {
    time <- populations$time
    populations$time <- NULL
  }
  else
    stop("No time available")

  # Sort out the line colours for the populations
  labels <- colnames(populations)
  if (is.na(col[1]))
    line.cols <- seq_along(labels)
  else {
    if (all(labels(col) == seq_along(col)))
      line.cols <- rep(col, length.out = length(labels))
    else {
      line.cols <- vector()
      for (name in labels)
        line.cols <- c(line.cols, col[name])
    }
  }

  # Sort out the line types for the populations
  if (is.na(lty[1]))
    line.ltys <- seq_along(labels)
  else {
    if (all(labels(lty) == seq_along(lty)))
      line.ltys <- rep(lty, length.out = length(labels))
    else {
      line.ltys <- vector()
      for (name in labels)
        line.ltys <- c(line.ltys, lty[name])
    }
  }

  # Sort out the y limits on the graph if need be
  if (is.na(ylim[1]))
    ylim <- c(0, max(rowSums(populations)))

  # And now plot the graphs
  for (index in seq_along(labels)) {
    label <- labels[index]
    this.pop <- populations[[label]]
    if (new.graph) {
      # When it's a new plot, do labels and legends, etc.
      plot(time, this.pop,
           ylim = ylim, xlab = "time", ylab = "population size",
           type = "l", col = line.cols[index], lty = line.ltys[index], ...)
      if (with.legend) # Plot the legend if desired
        graphics::legend("topright", legend = labels, lty = line.ltys,
                         col = line.cols)
      new.graph <- FALSE
    }
    else # Otherwise just draw the lines
      graphics::lines(time, this.pop, col = line.cols[index],
                      lty = line.ltys[index], ...)
  }
}
