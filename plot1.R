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

plot1<-function(df){
  
  if(is.null(df))
    df <- getData.R()
  
  message("Constructing histogram of Global Active Power ...")
  png("plot1.png",width=480,height=480,units="px",bg="transparent")
  
  hist(
    df$Global_active_power,
    col="red", 
    main="Global Active Power", 
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency"
  )
  
  dev.off() 
  message("Check working directory for plot1.png")
}

