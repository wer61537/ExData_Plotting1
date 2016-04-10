##=============================================================
## Function: getData
## Args:
##   None  
## Returns:
##    a dataframe 0f 2880 obs w/ 10 vars
##    Date                 : Date
##    Time                 : chr
##    Global_active_power  : num
##    Global_reactive_power: num
##    Voltage              : num
##    Global_intensity     : num
##    Sub_metering_1       : num
##    Sub_metering_2       : num
##    Sub_metering_3       : num
##    timestamp            : POSIXlt; concatenation of Date and Time
##
## Purpose:
##   A function that checks for zip file, extracts the zip file,
##     loads only Feb 1 and Feb 2 of 2207
##     concatenates date and time into a timestamp
##=============================================================
getData <- function(){
  
  # read.csv.sql in sqldf allows selecting subsets w/SQL 
  # see  https://cran.r-project.org/web/packages/sqldf/sqldf.pdf
  # and http://www.r-bloggers.com/how-to-read-quickly-large-dataset-in-r/
  library(sqldf)
  
  #  vars for files
  fileName <- "household_power_consumption.zip"
  datafile <-"household_power_consumption.txt"
  
  # download file if necessary
  if(! file.exists(fileName)) {
    message("Downloading household_power_consumption.zip ...")
    fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url=fileURL,destfile=fileName)
  }
  
  # extract if needed
  if(! file.exists("household_power_consumption.txt")) {
    message("Extracting household_power_consumption.txt from the zip file ...")
    unzip(zipfile=fileName, exdir="./")
  }
  
  # file is semi-colon separated 
  #date is dd/mm/yyyy so Feb 1 is 1/2/2007
  message("Loading data for the 2 days ...")
  febData2 <- read.csv.sql(datafile,sql = 
                            "SELECT * 
                            FROM file 
                            WHERE Date 
                            in ('1/2/2007','2/2/2007')",  
                            header = TRUE, 
                            sep = ";"
                           )
  
  # create timestamp from date and time
  # date and time are in separate fields but plots 2-4 need date time
  message("Creating timestamp column...")
  febData2$datetime  <- as.POSIXct(strptime(paste(febData2$Date, febData2$Time), "%d/%m/%Y %H:%M:%S"))
  #head(febData2)
  message("Returning a data frame ...")
return (febData2)
}