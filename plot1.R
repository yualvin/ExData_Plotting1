##read full table
fulltable<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.strings="?")

##subset data to only 1 and 2 February 2007
data<-subset(fulltable, Date=="1/2/2007" | Date=="2/2/2007",drop=FALSE)

##Draw Histogram
hist(data$Global_active_power, col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

##Copy to 480x480 png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
