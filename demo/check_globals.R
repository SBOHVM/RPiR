### Does the function works without any external (global) information?
library(codetools)
library(RPiR)

if (length(findGlobals(plot_simple, merge=FALSE)$variables) != 0)
{
  stop("Function plot_simple() may not use global variable(s): ",
       findGlobals(plot_simple, merge=FALSE)$variables)
}

if (length(findGlobals(plot_populations, merge=FALSE)$variables) != 0)
{
  stop("Function plot_populations() may not use global variable(s): ",
       findGlobals(plot_populations, merge=FALSE)$variables)
}

if (length(findGlobals(run_simple, merge=FALSE)$variables) != 0)
{
  stop("Function run_simple() may not use global variable(s): ",
       findGlobals(run_simple, merge=FALSE)$variables)
}

if (length(findGlobals(run_simulation, merge=FALSE)$variables) != 0)
{
  stop("Function run_simulation() may not use global variable(s): ",
       findGlobals(run_simulation, merge=FALSE)$variables)
}

if (length(findGlobals(cleanup_times, merge=FALSE)$variables) != 0)
{
  stop("Function cleanup_times() may not use global variable(s): ",
       findGlobals(cleanup_times, merge=FALSE)$variables)
}

if (length(findGlobals(cleanup_timesteps, merge=FALSE)$variables) != 0)
{
  stop("Function cleanup_timesteps() may not use global variable(s): ",
       findGlobals(cleanup_timesteps, merge=FALSE)$variables)
}

if (length(findGlobals(cleanup_events, merge=FALSE)$variables) != 0)
{
  stop("Function cleanup_events() may not use global variable(s): ",
       findGlobals(cleanup_events, merge=FALSE)$variables)
}

if (length(findGlobals(run_integration, merge=FALSE)$variables) != 0)
{
  stop("Function run_integration() may not use global variable(s): ",
       findGlobals(run_integration, merge=FALSE)$variables)
}
