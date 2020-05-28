library(shiny)
library(readr)

CarSale <- read_csv("CarSales.csv")

ui <- fluidPage(
  
  titlePanel("Details"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("carList","select the fields", choices =  names(CarSale))
    ),
    mainPanel(
      plotOutput("carDetails")
    )
  )
)

server <- shinyServer(function(input, output){
    output$carDetails <- renderPlot({
      hist(CarSale[,input$carList])
   })
})

shinyApp(ui=ui,server=server)
