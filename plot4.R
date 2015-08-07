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
png(filename = "plot4.png", width = 480, height = 480)

##Set parameter of multiplot
par(mfcol=c(2,2))

##Draw Plot 1: Line scatterplot from Plot2
with(newdata,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

##Draw Plot 2: Scatterplot from Plot3 with legend border removed
with(newdata,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(newdata,lines(datetime,Sub_metering_2,type="l",col="Red"))
with(newdata,lines(datetime,Sub_metering_3,type="l",col="Blue"))
##Add legend to scatterplot
legend("topright",col=c("Black","Red","Blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,bty="n")

##Draw Plot 3: Line scatterplot with Voltage
with(newdata,plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

##Draw Plot 4: Line scatterplot with Global_reactive_power
with(newdata,plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

##Turn off device
dev.off()
