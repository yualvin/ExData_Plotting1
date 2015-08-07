##read full table
fulltable<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.strings="?")

##subset data to only 1 and 2 February 2007
data<-subset(fulltable, Date=="1/2/2007" | Date=="2/2/2007",drop=FALSE)

##create new datetime variable and pasting it to the data table creating newdata table
datetime<-paste(data$Date,data$Time)
newdata<-cbind(datetime,data)

##changing datetime variable to time format
newdata$datetime<-strptime(newdata$datetime, "%d/%m/%Y %H:%M:%S")

##Open PNG device, do this after checking your scatterplot and legend is correct in screen
##Use this method instead of dev.copy as dev.copy will not work very well, the legend will be wrongly sized.
png(filename = "plot3.png", width = 480, height = 480)

##Draw scatterplot
with(newdata,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(newdata,lines(datetime,Sub_metering_2,type="l",col="Red"))
with(newdata,lines(datetime,Sub_metering_3,type="l",col="Blue"))

##Add legend
legend("topright",col=c("Black","Red","Blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)

##Turn off device
dev.off()
