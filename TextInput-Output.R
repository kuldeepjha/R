library(shiny)

ui <- fluidPage(
  
  # Application title
  titlePanel("INput OutPUT TEXT"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # inputBoxId is Id
      textInput("inputBoxId"," Input the number")
      ),
    mainPanel(
      paste("Your value"),
      # outputBoxId is Id
      textOutput("outputBoxId")
      )
    )
)

server <- shinyServer(function(input, output){
    # id of textOutput("outputBoxId")
  output$outputBoxId <- renderText({
    # id of textInput("inputBoxId"," Input the number")
    paste(input$inputBoxId)
  })
})

# Run the application 
shinyApp(ui = ui, server = server)