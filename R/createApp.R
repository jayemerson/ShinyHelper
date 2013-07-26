createApp <- function(appName, overwrite = FALSE)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  if (appName != .GlobalEnv$.shinier$name) {
    cat(appName, "conflicts with", .GlobalEnv$.shinier$name, "--",
        "proceed (Y/N)? ")
    foo <- readline()
    if (foo != "Y") stop("Stopping createApp()")
  }
  if (file.exists(appName) && !overwrite) stop("App exists") else {
    if (!file.exists(appName)) dir.create(appName)
  }
  writeLines(.GlobalEnv$.shinier$ui, file.path(appName, "ui.R"))
  writeLines(.GlobalEnv$.shinier$se, file.path(appName, "server.R"))

  if (length(.GlobalEnv$.shinier$data) > 0) {
    for (i in names(.GlobalEnv$.shinier$data)) {
      assign(i, .GlobalEnv$.shinier$data[[i]])
      save(list=i, file=file.path(appName, paste(i, ".Rdata", sep="")))
    }
  }
  .GlobalEnv$.shinier <- NULL
}

