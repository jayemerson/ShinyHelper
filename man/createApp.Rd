\name{createApp}
\alias{createApp}
\title{
Create the Shiny application from the accumulated objects
}
\description{
After initializing a Shiny application skeleton and adding inputs
and outputs, write the server.R and ui.R files along with (possible)
injected data objects to a folder.
}
\usage{
createApp(appName, overwrite = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{appName}{The name of the application (and hence folder name)}
  \item{overwrite}{Overwrite a previous application by the same name
without warning.}
}
\details{
None
}
\value{
None
}
\references{
None
}
\author{
Jay Emerson
}
\note{
None
}
\seealso{
See also \code{\link{shinySkeleton}}, \code{\link{headerPanelAdd}},
and \code{\link{plotOutput}}, for example.
}
\examples{
# None
}
\keyword{dataset}
