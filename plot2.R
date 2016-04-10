##=============================================================
## Function: plot1
## Args:
##   df  dataframe of two days in Feb 2007
##       created with getData function
## Returns:
##    png file of Histogram of Global_active_power written to working directory
##
## Purpose:
##   A function to create a histogram of Global_active_power 
##=============================================================
source("getData.R")

plot2<-function(df ){  
  
  if(is.null(df))
    df <- getData.R()
  
  message("Constructing plot of Global Active Power ...")
  png("plot2.png",width=480,height=480,units="px",bg="transparent")
  
  
  plot(
    df$datetime,
    df$Global_active_power,
    xlab ="",
    ylab = "Global Active Power",
    type ="l"
  )
  
  dev.off()  
  message("Check working directory for plot2.png")
  
}