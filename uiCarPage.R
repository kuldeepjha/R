library(shiny)

ui <- fluidPage(
  
  titlePanel("Details"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("carList","select the Car", choices = CarData$Make)
    ),
    mainPanel(
      tableOutput("carDetails")
    )
  )
)

server <- shinyServer(function(input, output){
  output$carDetails <- renderTable({
    makeFilter <- subset(CarData,  CarData$Make == input$carList)
  })
})

# Run the application 
shinyApp(ui = ui, server = server)