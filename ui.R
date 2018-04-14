#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

dataset<-read.csv("D:/Documents/datasciencecoursera/DevelopingDataProducts/CarTemps/CarTemp.csv", header = TRUE, sep =",", check.names = FALSE)

# Define UI for application that estimates car temperature
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Estimated Vehicle Interior Air Temperature"),
  
  # Sidebar with a dropdown input for temperature 
  
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("scatterPlot"),
       selectInput("temp",
                   "Outside Temperature (F):",
                   names(dataset)[2:length(names(dataset))]),
       
       checkboxGroupInput("model",
                          "Select Models to Calculate and Display:",
                          c("Linear Regression", "Polynomial Regression")),
       
       tags$h4("Use the drop down and check boxes to explore the effect of outside temperature and time on the interior temperature of a vehicle.",
              tags$br(),
              tags$br(),
              "The drop down allows you to select different outside (and initial interior vehicle) temperatures.",
              tags$br(),
              tags$br(),
              "Selecting the check boxes will calculate and display different models along with the original data for the selected outside temperature.",
              tags$br(),
              tags$br()),
       
       tags$h6("Data sourced from:",
               tags$br(),
               "https://www.avma.org/public/PetCare/Pages/Estimated-Vehicle-Interior-Air-Temperature-v.-Elapsed-Time.aspx.")
    )
  )
)
