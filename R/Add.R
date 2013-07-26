headerPanelAdd <- function(title, windowTitle = NULL)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  ui <- .GlobalEnv$.shinier$ui

  title <- deparse(title)
  if (!is.null(windowTitle)) title <- paste(title, ", ",
                                            deparse(windowTitle), sep="")
  ui <- gsub("\"Application Title\"", title, ui)

  .GlobalEnv$.shinier$ui <- ui
  invisible(ui)
}


selectInputAdd <- function(inputId, label, choices, selected = NULL,
                           multiple = FALSE)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  ui <- .GlobalEnv$.shinier$ui

  # If choices is a 2-column object, take care of business nicely
  # If choices is a vector without names, then add them
  # Otherwise, assume the user has followed directions on the arguments.
  # This will add the input as the "last" input of the sidebarPanel.
  if (length(dim(choices))==2 && dim(choices)[2]==2) {
    thenames <- choices[,2]
    choices <- choices[,1]
    names(choices) <- thenames
  }
  if (length(dim(choices))==0 && is.null(names(choices))) names(choices) <- choices
  
  foo <- c(paste("      selectInput(", deparse(inputId), ", ", deparse(label), ",", sep=""),
           paste("        ", paste(deparse(choices), collapse=""), ",", sep=""),
           paste("        ", deparse(selected), ", ", deparse(multiple), ")", sep=""))
  
  startline <- grep("START sidebarPanel", ui)
  endline <- grep("END sidebarPanel", ui)
  if (startline+1 < endline) foo <- c(",", foo)
  ui <- c(ui[1:(endline-1)], foo, ui[endline:length(ui)])

  .GlobalEnv$.shinier$ui <- ui
  invisible(ui)
}

sliderInputAdd <- function(inputId, label, min, max, value, step = NULL,
         round = FALSE, format = "#,##0.#####", locale = "us",
         ticks = TRUE, animate = FALSE)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  ui <- .GlobalEnv$.shinier$ui

  foo <- c(paste("      sliderInput(", deparse(inputId), ", ", deparse(label), ",", sep=""),
           paste("        ", deparse(min), ", ", deparse(max), ",", sep=""),
           paste("        ", deparse(value), ", step=", deparse(step), ",", sep=""),
           paste("        round=", deparse(round), ", format=", deparse(format), ",", sep=""),
           paste("        locale=", deparse(locale), ",", sep=""),
           paste("        ticks=", deparse(ticks), ", animate=", deparse(animate), ")", sep=""))

  startline <- grep("START sidebarPanel", ui)
  endline <- grep("END sidebarPanel", ui)
  if (startline+1 < endline) foo <- c(",", foo)
  ui <- c(ui[1:(endline-1)], foo, ui[endline:length(ui)])

  .GlobalEnv$.shinier$ui <- ui
  invisible(ui)
}

textInputAdd <- function(inputId, label, value = "")
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  ui <- .GlobalEnv$.shinier$ui

  foo <- c(paste("      textInput(", deparse(inputId), ", ", deparse(label), ",", sep=""),
           paste("        ", deparse(value), ")", sep=""))

  startline <- grep("START sidebarPanel", ui)
  endline <- grep("END sidebarPanel", ui)
  if (startline+1 < endline) foo <- c(",", foo)
  ui <- c(ui[1:(endline-1)], foo, ui[endline:length(ui)])

  .GlobalEnv$.shinier$ui <- ui
  invisible(ui)
}

numericInputAdd <- function(inputId, label, value, min = NA, max = NA,
    step = NA)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  ui <- .GlobalEnv$.shinier$ui

  foo <- c(paste("      numericInput(", deparse(inputId), ", ", deparse(label), ",", sep=""),
           paste("        ", deparse(value), ", ", deparse(min), ",", sep=""),
           paste("        ", deparse(max), ")", sep=""))

  startline <- grep("START sidebarPanel", ui)
  endline <- grep("END sidebarPanel", ui)
  if (startline+1 < endline) foo <- c(",", foo)
  ui <- c(ui[1:(endline-1)], foo, ui[endline:length(ui)])

  .GlobalEnv$.shinier$ui <- ui
  invisible(ui)
}

checkboxGroupArrayInputAdd <- function(inputId, label, choices,
                                       selected = NULL, ncol = 3)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  ui <- .GlobalEnv$.shinier$ui

  # If choices is a 2-column object, take care of business nicely
  # If choices is a vector without names, then add them
  # Otherwise, assume the user has followed directions on the arguments.
  # This will add the input as the "last" input of the sidebarPanel.
  if (length(dim(choices))==2 && dim(choices)[2]==2) {
    thenames <- choices[,2]
    choices <- choices[,1]
    names(choices) <- thenames
  }
  if (length(dim(choices))==0 && is.null(names(choices))) names(choices) <- choices
  
  foo <- c(paste("      checkboxGroupArrayInput(", deparse(inputId), ", ",
                 deparse(label), ",", sep=""),
           paste("        ", paste(deparse(choices), collapse=""), ",", sep=""),
           paste("        ", deparse(selected), ", ", deparse(ncol), ")", sep=""))
  
  startline <- grep("START sidebarPanel", ui)
  endline <- grep("END sidebarPanel", ui)
  if (startline+1 < endline) foo <- c(",", foo)
  ui <- c(ui[1:(endline-1)], foo, ui[endline:length(ui)])

  .GlobalEnv$.shinier$ui <- ui
  invisible(ui)
}

plotOutputAdd <- function(outputId, width = "100%", height = "400px", plotcode = NULL)
{
  if (is.null(.GlobalEnv$.shinier)) {
    stop("No skeleton exists; see help(\"shinySkeleton\")")
  }
  ui <- .GlobalEnv$.shinier$ui
  se <- .GlobalEnv$.shinier$se

  if (is.null(plotcode)) stop("You must specify plot code")
  foo <- paste("      plotOutput(", deparse(outputId), ",", deparse(width),
               ",", deparse(height), ")", sep="")
  
  startline <- grep("START mainPanel", ui)
  endline <- grep("END mainPanel", ui)
  if (startline+1 < endline) foo <- c(",", foo)
  ui <- c(ui[1:(endline-1)], foo, ui[endline:length(ui)])
  
  foo <- c(paste("  output$", outputId, " <- renderPlot({", sep=""),
           paste("    ", plotcode, sep=""),
           "  })")
  startline <- grep("shinyServer content", se)
  se <- c(se[1:startline], foo, se[-c(1:startline)])
      
  .GlobalEnv$.shinier$ui <- ui
  .GlobalEnv$.shinier$se <- se
  invisible(list(ui=ui, se=se))
}

