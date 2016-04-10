##=============================================================
## Function: plot3
## Args:
##   df  dataframe of two days in Feb 2007
##       created with getData function
## Returns:
##    png file of plot of Sub Meters written to working directory
##
## Purpose:
##   A function to create a plot of Sub Meters
##=============================================================
source("getData.R")

plot3<-function(df){
  
  if(is.null(df))
    df <- getData.R()
  
  message("Constructing composite plot of 3 sub metering variables ...")
  png("plot3.png",width=480,height=480,units="px",bg="transparent")
  
  plot(
    df$datetime,
    df$Sub_metering_1,
    xlab ="",
    ylab = "Energy sub metering",
    type ="l",
    col = 'black'
  )
  
  lines(
    df$datetime,
    df$Sub_metering_2,
    col = "red"
  )
  
  lines(
    df$datetime,
    df$Sub_metering_3,
    col = "blue"
  )
  
  legend(
    'topright',
    c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
    col = c('black','red','blue'), 
    lty = 1, 
    lwd = 3
  )
  
  dev.off() 
  message("Check working directory for plot3.png")
  
}