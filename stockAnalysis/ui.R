library(shiny)

shinyUI(fluidPage(
  titlePanel("Stock Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("1. Select a stock to examine. (i.e SBUX, MSFT,GOOG)
               Information are collected from yahoo finance."),
      
      textInput("symb", "Symbol", "SPY"),
      
      helpText("2. Choose type of chart"),
      selectInput("chart", "Chart Type",
                  c("Candlesticks" = "candlestick",
                    "Bar" = "bar",
                    "Line" = "line",
                    "Matchsticks" = "matchstick"
                  )),
      
      helpText("3. Select Date Range to extract"),
      dateRangeInput("dates", 
                     "Date range",
                     start = "2015-06-01", 
                     end = as.character(Sys.Date())),
      
      br(),
      helpText("Optional"),
      checkboxInput("log", "Plot y axis on log scale", 
                    value = FALSE),
      
      checkboxInput("adjust", 
                    "Adjust prices for inflation", value = FALSE)
      ),
    
    mainPanel(h3(textOutput("caption")),
              tabsetPanel(type = "tabs", 
                          tabPanel("Chart", plotOutput("plot")),
                          tabPanel("Source Code",
                                   h2("All the Source code can be find in courera"),
                                   hr(),
                                   helpText("To get started"),
                                   p("1. Create a new folder named stockAnalysis in your working directory."),
                                   p("2. Download the following files and place them inside stockVis: ui.R, server.R, and helpers.R."),
                                   p("3. Launch the app"),
                                   br(),
                                   helpText("Important"), 
                                  p("stockAnalysis use R's quantmod package, so you'll need to install quantmod"),
                                  br(),
                                  helpText("By default, the stock symbol displays the SPY ticker (an index of the entire S & P 500). To look up a different stock, type in a stock symbol that Yahoo finance will recognize. Some common symbols are GOOG (Google), AAPL (Apple), and GS (Goldman Sachs)."),
                                  br(),
                                  helpText("stockAnalysis relies heavily on two functions from the quantmod package:"),
                                    
                                  p("1. It uses getSymbols to download financial data straight into R from websites like Yahoo finance"),
                                  p("2. It uses chartSeries to display prices in an attractive chart")
                                  
                                
                                  
                                  )
                          )
              )
  )
)
)