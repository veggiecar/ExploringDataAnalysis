setwd("C:/Users/Mike/Documents/DataScienceProgram/4 Exploring Data Analysis/WorkingDirectory")
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
mydate <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Date <- mydate
data <- subset(mydata, Date == "2007-02-01"| Date == "2007-02-02")

x <- paste(data$Date, data$Time, sep=" ") ## merges date and time into character
y <- strptime(x, "%Y-%m-%d %H:%M:%S")  ## converts pasted date time


library(datasets)

par(mfrow=c(2,2))

plot(y, (as.numeric(as.character(data$Global_active_power))), type = "l", 
     ylab = "Global Active Power", xlab = "")


plot(y, (as.numeric(as.character(data$Voltage))), type = "l", 
     ylab = "Voltage", xlab = "datetime")
par(new=TRUE)
plot(y, (as.numeric(as.character(data$Sub_metering_1))), type="l", col="black", 
     xlab="", ylab="Energy sub metering", cex.lab = 1, yaxt="n")
axis(2,cex.axis = .8, at = seq(0, 30, by = 10), las=2)
par(new=TRUE)
plot(y, (as.numeric(as.character(data$Sub_metering_2))),  type="l", col="red",
     xlab="", ylab="",ylim=c(0,35), yaxt="n")
par(new=TRUE)
plot(y, (as.numeric(as.character(data$Sub_metering_3))),  type="l", col="blue",
     xlab="", ylab="", ylim=c(0,35), yaxt="n")
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), lwd=2,
       col=c("black", "red", "blue"), bty = "n", cex=.8)

plot(y, (as.numeric(as.character(data$Global_reactive_power))), type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(device = png, filename = 'Plot4.png', width = 480, height = 480) 
dev.off()