#
# Build a Shiny data explorer for the 2012 Environmental Performance
# Index data (see http://epi.yale.edu for more information).
#
# Note: this demonstration, if completed, will have side-effects,
# leaving a directory EPI_2012 in your active directory.
# You will have to delete in manually if you don't want it, but you
# might want to examine ui.R and server.R to learn more about Shiny.
#

data(epi)
x <- epi      # Because I'm lazy

##################################################################
# Initialize with an empty Shiny application skeleton:

shinySkeleton("EPI_2012")

##################################################################
# Creating the headerPanel():

headerPanelAdd("2012 Environmental Performance Index", "2012 EPI")
showUI()

##################################################################
# Add some inputs:

selectInputAdd("country", "Select Primary Country:",
               x[!duplicated(x$ISO), c("ISO3V10", "Country")])
selectInputAdd("var1", "Select Primary Variable:", names(x)[10:ncol(x)])
selectInputAdd("var2", "Select Secondary Variable (optional):",
               c("none", names(x)[10:ncol(x)]))
sliderInputAdd("yearrange", "Select year range:", 2000, 2010, c(2000, 2010),
               step=1, format="####")
checkboxGroupArrayInputAdd("countries", "Select Comparator Countries:",
                           sort(unique(x$ISO)), ncol=5)

##################################################################
# Inject the data:

injectData(x, "x")

##################################################################
# Add a plot.  Here's the essential point: write your normal
# plot code, making use of any data object(s) injected into the
# application (above).  Make use of user inputs via input$country
# and input$var1, etc...
#
# Note that here you are writing R code inside a character object,
# and then you will add this to the application, below.

myplot <- '
    maxyear <- input$yearrange[2]
    minyear <- input$yearrange[1]
    y <- x[x$ISO==input$country, c("Year", input$var1)]
    y <- y[y$Year >= minyear & y$Year <= maxyear,]
    ylab <- input$var1
    if (input$var2!="none") ylab <- paste(ylab, ", ", input$var2, sep="")
    maincountry <- x$Country[which(x$ISO==input$country)[1]]
    plot(y[,1], y[,2], xlab="Year", ylab=ylab,
         xlim=c(minyear-1,maxyear+1), ylim=c(0,100),
         main=paste(maincountry, " (shown in bold)", sep=""), type="l", lwd=5)
    text(minyear-0.5, y[1,2], input$country)
    if (input$var2!="none") {
      y <- x[x$ISO==input$country, c("Year", input$var2)]
      y <- y[y$Year >= minyear & y$Year <= maxyear,]
      lines(y[,1], y[,2], col="green", lwd=5)
      text(minyear-0.5, y[1,2], input$country, col="green")
    }
    if (length(input$countries)>0) {
      for (thisc in input$countries) {
        y <- x[x$ISO==thisc,c("Year", input$var1)]
        y <- y[y$Year >= minyear & y$Year <= maxyear,]
        lines(y[,1], y[,2])
        text(maxyear+0.5, y[nrow(y),2], thisc)
        if (input$var2!="none") {
          y <- x[x$ISO==thisc,c("Year", input$var2)]
          y <- y[y$Year >= minyear & y$Year <= maxyear,]
          lines(y[,1], y[,2], col="green")
          text(maxyear+0.5, y[nrow(y),2], thisc, col="green")
        }
      }
    }
'

##################################################################
# Now add the plot to the application:

plotOutputAdd("epiplot", plotcode = myplot)

##################################################################
# Creating the application in folder EPI_2012, which will
# include ui.R, server.R, and (in this case) a single data object,
# which I creatively call x.Rdata.

createApp("EPI_2012")
dir()
dir("EPI_2012")

##################################################################
############## LAUNCH THE APPLICATION IN YOUR BROWSER ############

## This part of the demo is over!  In the R console, run the
## application:
##
## > runApp("EPI_2012")

## When done, press <control>-C in the R console 


