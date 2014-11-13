require(ShinyHelper)

shinyUI(

  pageWithSidebar( # START pageWithSidebar

    headerPanel("01_hello via ShinyHelper"),

    sidebarPanel( # START sidebarPanel
      sliderInput("bins", "Number of bins:",
        1, 50,
        30, step=NULL,
        round=FALSE, format="#,##0.#####",
        locale="us",
        ticks=TRUE, animate=FALSE)
    ), # END sidebarPanel

    mainPanel( # START mainPanel
      plotOutput("distplot","100%","400px")
    ) # END mainPanel

  ) # END pageWithSidebar

)
