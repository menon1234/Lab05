  #this program shows how votes in number and percent per election district

  library(shiny)
  library(httr)
  library(ggplot2)
  library(dplyr)
  library(readxl)

  url<-"https://data.val.se/val/val2014/statistik/2014_landstingsval_per_kommun.xls"

  retrieve_data<-GET(url = url, write_disk(tempo<- tempfile(fileext = ".xls")))
  get_data_tempo <- read_excel(tempo, 1L, col_names = TRUE)
  get_data_dataframe<-get_data_tempo[,-c(1,23:110,117:118)]
  colnames(get_data_dataframe) <- c(get_data_dataframe[1,])
  get_data_dataframe <- as.data.frame(get_data_dataframe)
  colnames(get_data_dataframe) <- c("County","Municipality","County_name","M votes","M%","C votes","C%","FP votes","FP %","KD votes","KD%","S votes","S%","V votes","V%","MP votes","MP%","SD votes","SD%","FI votes","FI%","OVR votes","%OVR","BLANK votes","BLANK%","OG votes","OG%","Voter Turnout","Turnout %")
  #
  #Votes from each municipality
#' MunicipalityInput
#'
#' @param MunicipalityInput takes in this argument and plots a graph.
#' @import ggplot2
#' @return
#' @export
#'
#' @examples
#' {
#'
#'  Municipality(MunicipalityInput =   "Stockholms län")
#' }
  Municipality <- function(MunicipalityInput){
    if( is.character(MunicipalityInput)){

      municipality_temp <- get_data_dataframe[get_data_dataframe$Municipality == MunicipalityInput,]
      Municipality_df <- municipality_temp[,-c(1,3,5,7,9,11,13,15,17,19,21,23,25,27,28,29)]

      trans_Muni_df<-t(Municipality_df)
      row.names(trans_Muni_df) <-c("Municipality","M","C","FP","KD","S","V","MP","SD","FI","OVR","BLANK","OG")
      x_axis<-row.names(trans_Muni_df)
      y_axis<-as.vector(trans_Muni_df[,2])
      Partynames<-vector()
      Votecount<-vector()
      fdf<-data.frame(Partynames= x_axis, Votecount =  y_axis)
      g<-ggplot(data =fdf,aes (x=Partynames,y = Votecount)) + geom_bar(stat="identity") + geom_text(aes(label=Votecount), vjust=1.6, color="black", size=3.5) +
        theme_minimal() + labs(title = "Municipality Result")



      return(g)
    } else print("Error:Input type invalid")
  }


#' Vote%
#' @description Gives the percentage of votes for each municipality
#' @param vpert this argument returns the plot for parties vs vote%
#'
#' @return
#' @export
#' @import ggplot2
#' @examples
#' Votepercentage(vpert =   "Stockholms län")
Votepercentage<-function(vpert)
{
  if( is.character(vpert)){
    percentage_temp <- get_data_dataframe[get_data_dataframe$Municipality == vpert,]
    percentage_df<-percentage_temp[,-c(1,3,4,6,8,10,12,14,16,18,20,22,24,26,28)]

    trans_per_df<-t(percentage_df)
    row.names(trans_per_df) <-c("Municipality","M%","C%","FP%","KD%","S%","V%","MP%","SD%","FI%","OVR%","BLANK%","OG%","Turnout%")
    x_axis<-row.names(trans_per_df)
    y_axis<-as.vector(trans_per_df[,1])
    Municipalities<-vector()
    VotePercent<-vector()
    fdf3<-data.frame(Municipalities,VotePercent)
    g2<-ggplot(data =fdf3,aes (x=Municipalities,y = VotePercent)) + geom_bar(stat="identity") + geom_text(aes(label=VotePercent), vjust=1.6, color="black", size=3.5) +
      theme_minimal() + labs(title = "Percentage Result")
    return(g2)
  } else print("Error:Input type invalid")

}

 Votepercentage(vpert =   "Stockholms län")
