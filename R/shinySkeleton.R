shinySkeleton <- function(name = "myshinyapp") {

  if (!is.null(.GlobalEnv$.shinier)) {
    cat("A ShinyHelper session exists: flush and overwrite (Y/N)? ")
    ans <- readline()
    if (ans!="Y") {
      stop("See .GlobalEnv$.shinier to examine the existing object.")
    }
  }
  if (file.exists(name)) {
    warning(paste("A Shiny application by that name exists in this directory;",
                  "proceed with caution and be careful with createApp().",
                  sep="\n"))
  }

  .GlobalEnv$.shinier <- list(
    name = name,
    ui = readLines(system.file("skeleton/ui.R", package="ShinyHelper")),
    se = readLines(system.file("skeleton/server.R", package="ShinyHelper")),
    data = list()
  )

  invisible(.GlobalEnv$.shinier)
}

