\name{injectData}
\alias{injectData}
\title{
Inject a data set into the Shiny application under construction
}
\description{
The R code injected into an application (typically for the purpose of
analysis, summarization, or a plot output) may need access to one or
more R objects.  This function provides that functionality.
}
\usage{
injectData(x, var)
}
\arguments{
  \item{x}{the object to be injected}
  \item{var}{a character string giving the name of the object for usage within
the Shiny application, which might often be the name of the first argument itself
(but quoted)}
}
\details{
Once injected, the object will be available for usage inside any R code
for things like analysis, summarization, or plot output (going into server.R).
}
\value{
Invisibly returns the current server.R object.
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
See Also \code{\link{shinySkeleton}}, \code{\link{showServer}}.
}
\examples{
# None
}
\keyword{dataset}
