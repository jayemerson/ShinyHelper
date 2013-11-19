ShinyHelper (previously called shinier)
=======

A package extending package shiny (in very minor ways) and
assisting in the creation of Shiny interactive web applications.
As I learn more about Shiny, I may end-of-life this.  But for now,
here we go!

## Features

If you don't know anything about [Shiny](http://www.rstudio.com/shiny/),
you should visit the [R Studio](http://www.rstudio.com) folks.  They
have a nice [Shiny Tutorial](http://rstudio.github.io/shiny/tutorial/), too.
Package shinier includes functions (well, one function at this point)
that may ultimately be included in package shiny.
Other functions don't belong in package shiny and might be maintained here
for the purpose of extending Shiny functionality.

## Installation

The package is in development and may be unstable.  I'll try to keep
the master branch in working order on Github, so have a look at my
[Github repository](http://github.com/jayemerson/ShinyHelper).  Once it has
some functionality that someone might actually use, I'll put it on CRAN.

## Getting Started

The package includes a sample data set, from the 2012 iteration of the
Yale/Columbia [Environmental Performance Index](http://epi.yale.edu/).
Try this in R:

---
> require(devtools)
> install_github('ShinyHelper', 'jayemerson')
> library(ShinyHelper)  
> demo("EPI_2012")  
> runApp("EPI_2012")     # Interactive, not over the web

---

When you're done, have a look at the files in the `EPI_2012` folder that
was created by the demo.  This sample application uses the basics of Shiny.
The same application could be created in different ways by directly authoring
`ui.R` and `server.R`.  The use of more advanced Shiny features would
require this.  To use package ShinyHelper to create your own application,
examine the R code provided in the demo (`ShinyHelper/demo/EPI_2012.R`).

## An Even Simpler Example

---

> library(ShinyHelper)  
> shinySkeleton("toyapplication")  
> headerPanelAdd("My Toy Application")  
> sliderInputAdd("n", "Choose the sample size:", 100, 500, 100)  
> plotOutputAdd("myplot", plotcode =  
>   '  
>        hist(rnorm(input$n), main="Histogram from rnorm()")  
>        abline(v=0, lwd=3, col="red")  
>   ')  
> createApp("toyapplication")  
> runApp("toyapplication")      # Interactive, not over the web

---

## License

The ShinyHelper package is licensed under the GPLv3.
