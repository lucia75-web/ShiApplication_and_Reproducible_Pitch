library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Shiny Application and Reproducible Pitch"),
  
  sidebarPanel(
    # Sidebar with controls to select a dataset 
    selectInput("dataset", "Choose a dataset:", 
                choices = c("Mtcars", "Airquality", "Women"))
    ),
  
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Table", tableOutput("table")),
      tabPanel("Summary", verbatimTextOutput("summary")), 
      tabPanel("Plot", plotOutput("plot",width = "800", height = "800")),
      tabPanel("PCA Analysis", verbatimTextOutput("PCAAnalysis"))
    )    
  )
 
  
))
 