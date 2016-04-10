source("getData.R")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")

#get the data into a dataframe
df<-getData()

#look at first rows to be sure dates are ok
head(df)

#create the plots
plot1(df)
plot2(df)
plot3(df)
plot5(df)