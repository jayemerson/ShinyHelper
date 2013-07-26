\name{headerPanelAdd}
\alias{headerPanelAdd}
\title{Create a header panel}
\usage{
  headerPanelAdd(title, windowTitle = NULL)
}
\arguments{
  \item{title}{An application title to display}

  \item{windowTitle}{The title that should be displayed by
  the browser window.  Useful if \code{title} is not a
  string. If \code{NULL} then \code{title} is used.}
}
\value{
  A headerPanel that can be passed to
  \link{pageWithSidebar}
}
\description{
  Create a header panel containing an application title.
}
\seealso{
See also the underlying function \code{\link[shiny]{headerPanel}}.
}
\examples{
# None
}

