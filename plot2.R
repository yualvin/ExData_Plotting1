##read full table
fulltable<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.strings="?")

##subset data to only 1 and 2 February 2007
data<-subset(fulltable, Date=="1/2/2007" | Date=="2/2/2007",drop=FALSE)

##create new datetime variable and pasting it to the data table creating newdata table
datetime<-paste(data$Date,data$Time)
newdata<-cbind(datetime,data)

##changing datetime variable to time format
newdata$datetime<-strptime(newdata$datetime, "%d/%m/%Y %H:%M:%S")

##Draw scatterplot
with(newdata,plot(datetime,Global_active_power,,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

##Copy to 480x480 png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()



