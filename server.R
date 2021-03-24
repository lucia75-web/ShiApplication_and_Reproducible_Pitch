library(shiny)
library(datasets)
library(GGally)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "Mtcars" = mtcars,
           "Airquality" = airquality,
           "Women" = women)
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    summary(datasetInput())
  })

  # Generate an HTML table view of the dataset
  output$table <- renderTable({
    data.frame(datasetInput())
  })
  
  # Generate the principal component analysis of the dataset deleting 
  # the data that are NA and non numeric
  output$PCAAnalysis <- renderPrint({
    dataset <-datasetInput()
    dataset <- dataset[, colSums(is.na(dataset)) == 0] 
    dataset <- dataset[, sapply(dataset, is.numeric)]
    PCA <- princomp(dataset)
    print(summary(PCA, loadings = TRUE), cutoff = .3)
    cor(dataset)
  })
  

  # Generate a plot of the data. 
  output$plot <- renderPlot({
    ggscatmat(datasetInput())
  })

})