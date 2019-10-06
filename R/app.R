#this program shows the no. of votes recieved by parties in a given municipality

library(shiny)
library(ggplot2)
library(dplyr)
library(jsonlite)
library(httr)

url<-"https://data.val.se/val/val2014/statistik/2014_landstingsval_per_kommun.xls"

retrieve_data<-GET(url = url, write_disk(tempo<- tempfile(fileext = ".xls")))
get_data_tempo <- read_excel(tempo, 1L, col_names = TRUE)
get_data_dataframe<-get_data_tempo[,-c(1,23:110,117:118)]
colnames(get_data_dataframe) <- c(get_data_dataframe[1,])
get_data_dataframe <- as.data.frame(get_data_dataframe)
colnames(get_data_dataframe) <- c("County","Municipality","county name","M votes","M%","C votes","C%","FP votes","FP %","KD votes","KD%","S votes","S%","V votes","V%","MP votes","MP%","SD votes","SD%","FI votes","FI%","OVR votes","%OVR","BLANK votes","BLANK%","OG votes","OG%","Voter Turnout","Turnout %")

ui <-fluidPage(
  titlePanel(h1("Statistics on the 2014 election in sweden")),
  sidebarLayout(
    sidebarPanel(
      selectInput("MunicipalityInput","Municipality",
                  unique(as.charactar(get_data_dataframe$Municipality)),
                  actionButton("button_press","Statistics"),

      )
    ),
    mainPanel (plotOutput("p")),

  )
)

server<-function(input,output)
{
  observeEvent(input$button_press,{
    output$p<-renderPlot({
      source("./Municipality_Statistics.R")
      MunicipalityResults(MunicipalityInput = (input$MunicipalityInput))
    })
  })
}

shinyApp(ui = ui,server = server)
