library(shiny)

ui <- fluidPage(
  
  titlePanel("Profile page"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("nameTxt","Enter the name"),
      selectInput("selectCountry","Select the Country", c("select","India","USA","UK")),
      textInput("addressTxt","Enter the address"),
      textInput("zipTxt","Enter the ZipCode"),
      textInput("phoneTxt","Enter the Phone No")
    ), 
    mainPanel(
      paste("Details you entring"),
      textOutput("outputName"),
      textOutput("outputCountry"),
      textOutput("outputaddress"),
      textOutput("outputZipCode"),
      textOutput("outputPhone")
    )
  )
)

server <- shinyServer(function(input, output){
  output$outputName <- renderText({
    paste(input$nameTxt)
  })
  
  output$outputCountry <- renderText({
    paste(input$selectCountry)
  })
  
  output$outputaddress <- renderText({
    paste(input$addressTxt)
  })
  
  output$outputZipCode <- renderText({
    paste(input$zipTxt)
  })
  
  output$outputPhone <- renderText({
    paste(input$phoneTxt)
  })
})


# Run the application 
shinyApp(ui = ui, server = server)