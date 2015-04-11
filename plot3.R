data<- read.csv("C:/Users/arpita/Desktop/coursera/ExData_Plotting1/household_power_consumption.txt", sep=";")
data<- data[(data$Date=='1/2/2007' | data$Date=='2/2/2007'),];

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

data$day <- weekdays(as.Date(data$Date))

data2 <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


plot(data2$timestamp,data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data2$timestamp,data2$Sub_metering_2,col="red")
lines(data2$timestamp,data2$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()