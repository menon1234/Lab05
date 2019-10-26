
library(dplyr)
library(httr)
library(readxl)
#' To check the average percentage election result from each section of the municipality
#'
#' @return returns a graph showing the plot between the percentage of party votes and the municipality
#' @export
#'
#' @references "google.com"
getColumns<-function()
{

  url<-"https://data.val.se/val/val2014/statistik/2014_landstingsval_per_kommun.xls"

  retrieve_data2<-GET(url = url, write_disk(tempo<- tempfile(fileext = ".xls")))
  retrieve_data2<- read_xls(tempo,skip =2, col_names = TRUE)
  retrieve_data2<-as.data.frame(retrieve_data2,replace = TRUE )
  retrieve_data2<-retrieve_data2[-c(1:2),-c(23:110,117:118)]
  retrieve_data3<-retrieve_data2[,-c(5,7,9,11,13,15,17,19,21,23,25,27,29)]
  retrieve_data3[is.na(retrieve_data3)]<-.01
  colnames(retrieve_data3)<-c("Municipality NO","County no.","Municipality","County","M%","C%","FP %","KD%","S%","V%","MP%","SD%","FI%","%OVR","BLANK%","OG%","Turnout %")
 return (retrieve_data3)
}
