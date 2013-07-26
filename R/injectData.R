injectData <- function(x, var)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  se <- .GlobalEnv$.shinier$se
  .GlobalEnv$.shinier$data[[var]] <- x

  startline <- grep("require(ShinyHelper)", se, fixed=TRUE)
  se <- c(se[1:startline],
          paste("load(", deparse(paste(var,".Rdata",sep="")), ")", sep=""),
          se[-c(1:startline)])

  .GlobalEnv$.shinier$se <- se
  invisible(se)
}

