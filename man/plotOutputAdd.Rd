\name{plotOutputAdd}
\alias{plotOutputAdd}
\title{Create an plot output element}
\usage{
  plotOutputAdd(outputId, width = "100\%", height = "400px", plotcode = NULL)
}
\arguments{
  \item{outputId}{output variable to read the plot from}

  \item{width}{Plot width. Must be a valid CSS unit (like
  \code{"100\%"}, \code{"400px"}, \code{"auto"}) or a
  number, which will be coerced to a string and have
  \code{"px"} appended.}

  \item{height}{Plot height}

  \item{plotcode}{A character string of R commands to produce the plot.}
}
\value{
  Invisibly return the ui.R and server.R code in a list.
}
\description{
  Render a \link{renderPlot} within an application page.
}
\author{Jay Emerson, based on \code{plotOutput} from package shiny.}
\seealso{
See also \code{\link[shiny]{plotOutput}}.
}
\examples{
# None
}

