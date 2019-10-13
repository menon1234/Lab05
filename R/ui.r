#this program shows the no. of votes recieved by parties in a given municipality
library(Lab05)
library(shiny)


ui <- fluidPage(

  titlePanel("Comprehensive statistics on the 2014 election in Sweden"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "Municipality_name",
                  label = "Municipality",
                  unique(as.character(get_data_dataframe$Municipality))),
      actionButton("button_1", "Municipality Results"),
      selectInput(inputId = "PercentageINput",
                  label = "MUniciplaity%",
                  unique(as.character(retrieve_data3$Municipality))),
      actionButton("button_2", "County Results")

    ),
    mainPanel(plotOutput("g"),
              br(),
              br(),
              plotOutput("g2"))
  )

)
