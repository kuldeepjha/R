library(shiny)

ui <- fluidPage(
  
  titlePanel("DaTa Table"),
  
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      DT::dataTableOutput("iris")
    )
  )
)

server <- shinyServer(function(input,output){
  output$iris <- DT::renderDataTable(
    iris,
    # this line of code for 'copy','pdf','csv','excel','print'
    extensions = 'Buttons', options = list(dom= 'Bfrtip', buttons = list('copy','pdf','csv','excel','print')) 
  )
}
)

shinyApp(ui=ui,server=server)