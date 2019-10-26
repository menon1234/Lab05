#this program shows the no. of votes recieved by parties in a given municipality

library(shiny)



ui <- fluidPage(

  titlePanel("Comprehensive statistics on the 2014 election in Sweden"),
  sidebarLayout(
    sidebarPanel(
      # selectInput(inputId = "MunicipalityInput",
      #                    label = "Municipality",
      #                    unique(as.character(get_data_dataframe$Municipality))),
      # actionButton("button_1", "Municipality Results"),

      uiOutput('A_panel'),
      actionButton("button_2", " Results")

    ),
    mainPanel(plotOutput("g"),plotOutput("g2"))
  )

)
server<-function(input,output)
{
  # observeEvent(input$button_1,{
  #   output$g<-renderPlot({
  #     source("./Municipality_Statistics.R")
  #     Municipality(MunicipalityInput = (input$MunicipalityInput))
  #   })
  # })
  output$A_panel <- renderUI({

    source("./getmuni.r")
    retrieve_data3 = getColumns()
    selectInput("PercentageInput",
                label = "Municiplaity Total and percentage votes",
                unique(as.character(retrieve_data3$Municipality)))
  })

  observeEvent(input$button_2,{ output$g2<-renderPlot({
  source("./MunicipalityPercentage.R")

    PercentageCalc(PercentageInput= (input$PercentageInput)) })

   output$g<-renderPlot({
    source("./Municipality_Statistics.R")

     Municipality(MunicipalityInput= (input$PercentageInput)) })
   })
}

shinyApp(ui = ui,server = server)

