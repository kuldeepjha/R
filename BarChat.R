library(shiny)

ui <- fluidPage(
  
  titlePanel("Bar chat"),
  sidebarLayout(
    sidebarPanel(
      checkboxInput("checkBoxId", "Create the bar chat")
    ),
    plotOutput("outbarId")
  )
)

server <- shinyServer(function(input, output){
  output$outbarId <- renderPlot({
    bar2 <- tapply(mtcars$mpg, list(mtcars$am,mtcars$gear), mean)
    barplot(bar2, beside = input$checkBoxId)
  })
})

shinyApp(ui=ui,server=server)