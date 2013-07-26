\name{checkboxGroupArrayInput}
\alias{checkboxGroupArrayInput}
\alias{checkboxGroupArrayInputAdd}
\title{Checkbox Group Input Control (Array Layout)}
\usage{
  checkboxGroupArrayInput(inputId, label, choices,
    selected = NULL, ncol = 3)
  checkboxGroupArrayInputAdd(inputId, label, choices,
    selected = NULL, ncol = 3)
}
\arguments{
  \item{inputId}{Input variable to assign the control's
  value to.}

  \item{label}{Display label for the control.}

  \item{choices}{List of values to show checkboxes for. If
  elements of the list are named then that name rather than
  the value is displayed to the user.}

  \item{selected}{Names of items that should be initially
  selected, if any.}

  \item{ncol}{Number of columns to use for the array of checkboxes.}
}
\value{
  A list of HTML elements that can be added to a UI
  definition.
}
\description{
  Create an array of checkboxes that can be used to toggle
  multiple choices independently. The server will receive
  the input as a character vector of the selected values.
}
\author{
  Jay Emerson, but a direct modification of the original
  function checkboxGroupInput() of package shiny.
}
\examples{
checkboxGroupArrayInput("variable", "Variable:",
                        c("Cylinders" = "cyl",
                          "Transmission" = "am",
                          "Gears" = "gear"), ncol = 2)
}
\seealso{
  \code{\link{checkboxInput}},
  \code{\link{updateCheckboxGroupInput}}
}

