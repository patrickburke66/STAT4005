library(readr)
library(tidyverse)
alcoholdf <- read_csv("data/alcohol.csv")

library(shiny)

ui <- fluidPage(
  sidebarLayout(sidebarPanel(
    selectizeInput("countrychoice",
                   label = "Choose a Country", 
                   choices = levels(factor(alcoholdf$country)),
                   selected = "Afghanistan")),
    radioButtons(inputId = "varselect",
                 label = "Choose a Variable",
                 choices = names(alcoholdf)[c(2,3,4,5)])),
    mainPanel(plotOutput("histplot"))
  )


server <- function(input, output, session) {
  df_onecountry <- reactive({
    alcoholdf %>% filter(country == input$countryselect)
  })
  
  output$histplot <- renderPlot({
    ggplot(data = df_onecountry(), aes(x = .data[[input$varselect]])) +
      geom_histogram(color = "black", fill = "white", bins = 15)
  })

}

shinyApp(ui, server)

