\name{textInputAdd}
\alias{textInputAdd}
\title{Create a text input control}
\usage{
  textInputAdd(inputId, label, value = "")
}
\arguments{
  \item{inputId}{Input variable to assign the control's
  value to}

  \item{label}{Display label for the control}

  \item{value}{Initial value}
}
\value{
  A text input control is injected into the UI.
}
\description{
  Create an input control for entry of unstructured text
  values
}
\examples{
textInput("caption", "Caption:", "Data Summary")
}
\seealso{
  \code{\link{updateTextInput}}
}
\author{Jay Emerson, extending code from package shiny}

