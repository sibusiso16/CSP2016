library(shiny)
library(ggplot2)

ui <- fluidPage(
  plotOutput("plot", click = "click"),
  selectInput("xVar", "Select X", 
    choices = names(mtcars), selected = "wt"),
  verbatimTextOutput("clickVals")
)

server <- function(input, output) {
  output$plot <- renderPlot({
    qplot(mtcars[[input$xVar]], mtcars$mpg, xlab = input$xVar, ylab = "mpg")
  })
  
  output$clickVals <- renderPrint({
    cat("x=", input$click$x, "\ny=", input$click$y)
  })
  
}

shinyApp(ui, server)