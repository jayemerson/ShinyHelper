\name{selectInputAdd}
\alias{selectInputAdd}
\title{Create a select list input control}
\usage{
  selectInputAdd(inputId, label, choices, selected = NULL,
    multiple = FALSE)
}
\arguments{
  \item{inputId}{Input variable to assign the control's
  value to}

  \item{label}{Display label for the control}

  \item{choices}{List of values to select from. If elements
  of the list are named then that name rather than the
  value is displayed to the user. A 2-column object specifying
  user-friendly labels and underlying values is supported.}

  \item{selected}{Name of initially selected item (or
  multiple names if \code{multiple = TRUE}). If not
  specified then defaults to the first item for
  single-select lists and no items for multiple select
  lists.}

  \item{multiple}{Is selection of multiple items allowed?}
}
\value{
Invisibly return the UI.
}
\description{
  Create a select list that can be used to choose a single
  or multiple items from a list of values.
}
\author{Jay Emerson, extending \code{selectInput} from package shiny.}
\seealso{
See also the original \code{\link[shiny]{selectInput}} function.
}
\examples{
# None
}

