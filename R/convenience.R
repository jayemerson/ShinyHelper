showUI <- function()
{
  .GlobalEnv$.shinier$ui
}

showServer <- function()
{
  .GlobalEnv$.shinier$se
}

showData <- function()
{
  for (i in names(.GlobalEnv$.shinier$data)) {
    cat("\n\nFound injected data:", i, "\n")
    print(str(.GlobalEnv$.shinier$data[[i]]))
  }
}

flushShinier <- function()
{
  foo <- readline("Are you sure you want to flush (Y/N)?")
  if (foo == "Y") {
    .GlobalEnv$.shinier <- NULL
  } else { cat("Okay, not flushing.\n") }
}
