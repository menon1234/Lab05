
library(dplyr)
library(httr)
library(readxl)
#' To check the percentage of the election results in the municipalities
#'
#' @param PercentageInput this imports the municipality which from which each party has received how man votes
#'
#' @return returns a graph showing the plot between the percentage of party votes and the municipality
#' @export
#'
#' @references "google.com"
PercentageCalc<-function(PercentageInput)
{

url<-"https://data.val.se/val/val2014/statistik/2014_landstingsval_per_kommun.xls"

retrieve_data2<-GET(url = url, write_disk(tempo<- tempfile(fileext = ".xls")))
retrieve_data2<- read_xls(tempo,skip =2, col_names = TRUE)
retrieve_data2<-as.data.frame(retrieve_data2,replace = TRUE )
retrieve_data2<-retrieve_data2[-c(1:2),-c(23:110,117:118)]
retrieve_data3<-retrieve_data2[,-c(5,7,9,11,13,15,17,19,21,23,25,27,29)]
retrieve_data3[is.na(retrieve_data3)]<-.01
colnames(retrieve_data3)<-c("Municipality NO","County no.","Municipality","County","M%","C%","FP %","KD%","S%","V%","MP%","SD%","FI%","%OVR","BLANK%","OG%","Turnout %")

#a = sapply(retrieve_data3[,c(1,2,5:17)],as.numeric)


if(is.character(PercentageInput))
{

  tempercentage <- retrieve_data3[retrieve_data3$Municipality == PercentageInput,]
  transdf<-t(tempercentage)
  x_axis2<-as.vector( names(transdf[,1])[-(1:4)])

  yvalues = c()
  for(x in x_axis2)
  {
    yvalues = c(yvalues,mean(as.numeric(transdf[x,])))
  }
  y_axis2<-yvalues


  partynames<-vector()
  municipalities<-vector()
  fdf2<- data.frame( Partynames = x_axis2, Votepercent =  y_axis2)
 # print(fdf2)
  g2<-ggplot(data =fdf2, aes (x=Partynames,y = MunicipalityPercentage)) + geom_bar(stat="identity") + geom_text(aes(label=municipalities), vjust=1.6, color="black", size=3.5) +
    theme_minimal() + labs(title = "Percentage Result")

  return(g2)
}
else print("error:Invalid Input")
}

#PercentageCalc(PercentageInput =   "Kronobergs län")
