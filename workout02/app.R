#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Workout 2"),
   
   verticalLayout(
     fluidRow(
       column(4, 
              sliderInput('initial',
                          'Initial Amount',
                          min = 0,
                          max = 100000,
                          step = 500,
                          value = 1000),
              sliderInput('annual',
                          'Annual Contribution',
                          min = 0,
                          max = 50000,
                          step = 500,
                          value = 2000)),
       column(4, 
              sliderInput('return',
                          'Return Rate (in %)',
                          min = 0,
                          max = 20,
                          step = 0.1,
                          value = 5),
              sliderInput('growth',
                          'Growth Rate (in %)',
                          min = 0,
                          max = 20,
                          step = 0.1,
                          value = 2)),
       column(4,
              sliderInput('years',
                          'Years',
                          min = 0,
                          max = 50,
                          step = 1,
                          value = 20),
              selectInput('facet',
                          'Facet?',
                          c('No', 'Yes')))
     ),
     
     fluidRow(
       column(12, h4('Timelines'))
     ),
     
     fluidRow(
       column(12, plotOutput('plot'))
     ),
     
     fluidRow(
       column(12, h4('Balances'))
     ),
     
     fluidRow(
       column(12, verbatimTextOutput('balances'))
     )
   )
)

future_value <- function(amount, rate, years) {
  return(amount*((1 +rate) ^ years))
}
annuity <- function(contrib, rate, years) {
  return(contrib*((1 + rate)^years - 1)/rate)
}
growing_annuity <- function(contrib, rate, growth, years) {
  return(contrib*((1 + rate)^years - (1 + growth)^years)/(rate - growth))
}
library(ggplot2)
library(dplyr)
library(tidyr)
# Define server logic required to draw a histogram
server <- function(input, output) {
  
   output$plot <- renderPlot({
     year <- seq(0, input$years)
     no <- rep(0, length(year))
     no[1] <- input$initial
     fixed <- rep(0, length(year))
     fixed <- input$initial
     grow <- rep(0, length(year))
     grow <- input$initial
     
     for(i in 2:length(year)) {
       no[i] <- future_value(input$initial, input$return/100, year[i])
       fixed[i] <- no[i] + annuity(input$annual, input$return/100, year[i])
       grow[i] <- no[i] + growing_annuity(input$annual, input$return/100, input$growth/100, year[i])
     }
     
     modalities <- data.frame(year=year, no_contrib = no, fixed_contrib = fixed, growing_contrib = grow)
     modalities <- modalities %>% gather(key=modality, value=amount, no_contrib:growing_contrib, factor_key = TRUE)
     
     graph <- ggplot(modalities) + geom_line(aes(x=year, y=amount, color=modality)) + geom_point(aes(x=year, y=amount, color=modality))
     graph <- graph + labs(title= "Three modes of investing")
     if (input$facet == 'Yes') {
       graph <- graph + facet_grid(.~modality) + geom_area(aes(x=year, y=amount, fill = modality, alpha=0.6), show.legend = FALSE) + theme_bw()
     }
     graph
   })
   
   output$balances <- renderPrint({
     year <- seq(0, input$years)
     no <- rep(0, length(year))
     no[1] <- input$initial
     fixed <- rep(0, length(year))
     fixed <- input$initial
     grow <- rep(0, length(year))
     grow <- input$initial
     
     for(i in 2:length(year)) {
       no[i] <- future_value(input$initial, input$return/100, year[i])
       fixed[i] <- no[i] + annuity(input$annual, input$return/100, year[i])
       grow[i] <- no[i] + growing_annuity(input$annual, input$return/100, input$growth/100, year[i])
     }
     
     data.frame(year=year, no_contrib = no, fixed_contrib = fixed, growing_contrib = grow)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

