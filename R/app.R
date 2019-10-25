#this program shows the no. of votes recieved by parties in a given municipality
library(Lab05)
library(shiny)



ui <- fluidPage(

  titlePanel("Comprehensive statistics on the 2014 election in Sweden"),
  sidebarLayout(
    sidebarPanel(
      # selectInput(inputId = "MunicipalityInput",
      #                    label = "Municipality",
      #                    unique(as.character(get_data_dataframe$Municipality))),
      # actionButton("button_1", "Municipality Results"),

      selectInput(inputId = "PercentageInput",
                         label = "Municiplaity%",
                         unique(as.character(retrieve_data3$Municipality))),
      actionButton("button_2", "Percentage Results")

    ),
    mainPanel(plotOutput("g"),
                     br(),
                     br(),
                     plotOutput("g2"))
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
  observeEvent(input$button_2,{ output$g2<-renderPlot({
  source("./MunicipalityPercentage.R")
    MunicipalityPercentage(PercentageInput= (input$PercentageInput)) }) })
}

shinyApp(ui = ui,server = server)

