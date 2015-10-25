library(quantmod)
source("additional.R")

shinyServer(function(input, output) {
  dataInput <- reactive({  
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
    })
    head(data, 3)
    
    finalInput <- reactive({
      if (!input$adjust) return(dataInput())
      adjust(dataInput())
    })
    
    output$plot <- renderPlot({
    chartSeries(finalInput(), theme = chartTheme("white"), name = input$symb, 
               type = input$chart,log.scale = input$log, TA = NULL)         
    })
})

