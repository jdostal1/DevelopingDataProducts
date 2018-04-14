#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic 
shinyServer(function(input, output) {
   
  output$scatterPlot <- renderPlot({
    # plot interior vehicle temperatures based on outside temperature
    x = as.numeric(c(dataset$`Elapsed time`))
    y = unlist(select(dataset, input$temp), use.names = FALSE)
    plot(x, y, title(paste("Estimated Vehicle Interior Air Temperature vs. \n Time with Outside Temperature of ", input$temp)), 
         xlab = "Time in Minutes", ylab = "Temperature in Farenheit", ylim = c(65, 150))

    if ("Linear Regression" %in% input$model) {
      abline(lm(y~x), col="red", lwd=2)
    }
    if ("Polynomial Regression" %in% input$model) {
      lines(lowess(x, y), col="blue", lwd=2)
    }
  })
  
})
