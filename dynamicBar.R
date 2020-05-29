library(shiny)

ui <- fluidPage(
  
  titlePanel("Bar chat"),
  sidebarLayout(
    sidebarPanel(
      selectInput("xaxis", "select the value of xaxis",colnames(mtcars), selected = "gear"),
      selectInput("yaxis", "select the value of yaxis",colnames(mtcars), selected = "mpg"),
      checkboxInput("checkBoxId", "Create the bar chat")
    ),
    plotOutput("outbarId")
  )
)

server <- shinyServer(function(input, output){
  output$outbarId <- renderPlot({
    bar2 <- tapply(mtcars[,input$yaxis], list(mtcars[,input$xaxis]), mean)
    barplot(bar2, beside = input$checkBoxId)
  })
})

shinyApp(ui=ui,server=server)