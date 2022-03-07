

library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  mainPanel(textOutput("greeting"))
  
)

##Exercise1 

server1 <- function(input, output, session) {
  output$greeting <- renderText(paste0("Hello ", input$name))
}
## I changed `name` to `input$name`

server2 <- function(input, output, server) {
  output$greeting <- renderText(paste0("Hello ", input$name))
}
## I fixed it so it now said output$greeting, not just greeting.


server3 <- function(input, output, server) {
  output$greting <- paste0("Hello", input$name)
}
##I changed the typo from `greting` to `greeting,` as well as adding the renderText function.


## Exercise 2
server1 <- function(input, output, session) {
  c <- reactive(input$a + input$b)
  e <- reactive(c() + input$d)
  output$f <- renderText(e())
}

server2 <- function(input, output, session) {
  x <- reactive(input$x1 + input$x2 + input$x3)
  y <- reactive(input$y1 + input$y2)
  output$z <- renderText(x() / y())
}

server3 <- function(input, output, session) {
  d <- reactive(c() ^ input$d)
  a <- reactive(input$a * 10)
  c <- reactive(b() / input$c) 
  b <- reactive(a() + input$b)
}

shinyApp(ui, server1)
