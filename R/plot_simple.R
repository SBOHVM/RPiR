#' @title Simplest code to plot population(s) against time
#'
#' @description
#' A simple plot all of the populations in a data frame against time. One column
#' must be called "time" and will be used as the x-axis of the plot. The rest
#' will be used as different lines on the y-axis, with a legend denoting their
#' column names. See plot_populations() above for a more sophisticated plotting
#' function.
#'
#' @param populations Data frame with columns corresponding to different
#' population segments and a 'time' column
#' @param new.graph (optionally) whether to start a new graph, default TRUE
#' @param xlim (optionally, for new graphs) the limits of the x axis,
#' default min to max time
#' @param ylim (optionally, for new graphs) the limits of the y axis,
#' default min to max pop size
#' @param lty (optionally) the line type for all lines on the graph, default 1
#'
#' @export
#'
#' @examples
#' df <- data.frame(time = 0:100, grow=exp((0:100) / 10),
#'                  die = exp(seq(10, 0, by = -0.1)))
#' plot_simple(df, lty = c(2, 3))
#'
plot_simple <- function(populations, new.graph=TRUE, xlim=NA, ylim=NA,
                        lty=1) {
  # First make sure there's a time column in the data frame being plotted
  if (any(colnames(populations) == "time")) {
    time <- populations$time
    populations$time <- NULL
    # If need be, set x-limits on plot from it
    if (is.na(xlim[1]))
      xlim <- c(min(time), max(time))
  } else # Otherwise complain and stop...
    stop("No time info available - data frame must have a column called 'time'")

  # Get the column names of the data frame to use as labels
  labels <- colnames(populations)
  # Create our own standard set of colours
  line.cols <- seq_along(labels)

  # Get y-limits on graph from input if we haven't set our own
  if (is.na(ylim[1]))
    ylim <- c(0, max(rowSums(populations)))

  # And plot the individual columns against time
  for (index in seq_along(labels)) {
    label <- labels[index]
    this.pop <- populations[[label]]
    if (new.graph) {
      # Either in a new graph if appropriate
      plot(time, this.pop,
           xlim = xlim, ylim = ylim,
           xlab = "time", ylab = "population size",
           type = "l", col = line.cols[index], lty = lty[index])
      graphics::legend("topright", legend = labels, lty = lty, col = line.cols)
      new.graph <- FALSE
    } else # Or as a new line on an existing graph
      graphics::lines(time, this.pop, col = line.cols[index], lty = lty[index])
  }
}
