setwd("C:/Users/Mike/Documents/DataScienceProgram/4 Exploring Data Analysis/WorkingDirectory")
mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
mydate <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Date <- mydate
data <- subset(mydata, Date == "2007-02-01"| Date == "2007-02-02")

x <- paste(data$Date, data$Time, sep=" ") ## merges date and time into character
y <- strptime(x, "%Y-%m-%d %H:%M:%S")  ## converts pasted date time


library(datasets)

par(mfrow=c(1,1))

## histogram of Global Active Power
hist((as.numeric(as.character(data$Global_active_power))),  main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", col = "red")
dev.copy(device = png, filename = 'Plot1.png', width = 480, height = 480) 
dev.off()