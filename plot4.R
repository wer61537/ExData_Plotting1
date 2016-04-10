##=============================================================
## Function: plot4
## Args:
##   df  dataframe of two days in Feb 2007
##       created with getData function
## Returns:
##    png file of lattice plot in clockwise order
##    Global Active Power,Voltage Plot, 
##     Global Reactive Power, Energy Sub Metering
##
## Purpose:
##   A function to create a lattice plot 
##=============================================================
source("getData.R")

plot4<-function(df){

  if(is.null(df))
    df <- getData.R()
  
  message("Constructing lattice plot ...")
  png("plot4.png",width=480,height=480,units="px",bg="transparent")
  
  # Multiple Plots
  par(mfrow=c(2,2))
  
  message("Constructing Global Active Power for top left ...")
  plot(
    df$datetime,
    df$Global_active_power,
    xlab ="",
    ylab = "Global Active Power",
    type ="l"
  )
  
  message("Constructing Voltage for top right ...")
  plot(
    df$datetime,
    df$Voltage,
    xlab ="datetime",
    ylab = "Voltage",
    type ="l"
  )
  
  message("Constructing Energy Sub Metering for bottom left ...")
  plot(
    df$datetime,
    df$Sub_metering_1,
    xlab ="",
    ylab = "Energy sub metering",
    type ="l",
    col = 'black'
  )
  lines( df$datetime, df$Sub_metering_2, col = "red")
  lines( df$datetime, df$Sub_metering_3, col = "blue")
  
  legend(
    'topright', 
    c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
    col = c('black','red','blue'),
    lty = 1,
    lwd = 3
  )
  
  message("Constructing Global Reactive Power for bottom right ...")
  plot(
    df$datetime,
    df$Global_reactive_power,
    xlab ="datetime",
    ylab = "Global_reactive_power",
    type ="l"
  )
  
  dev.off() 
  message("Check working directory for plot4.png")
  

}