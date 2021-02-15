# read data
fileDir <- "household_power_consumption.txt"
data <- read.table(fileDir, header = TRUE, sep = ";", na.strings = "?")

# change date format to year-month-date
dateYMD <- strptime(data$Date, format = "%d/%m/%Y")
# convert dateYMD to format yyyy-mm-dd
data$Date <- as.Date(dateYMD)

# subset data
datafinal <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# paste date and time
datetime <- paste(datafinal$Date, datafinal$Time)
# name it and add to data frame
datetime <- setNames(datetime, "DateTime")
datafinal <- cbind(datetime,datafinal)
datafinal$datetime <- as.POSIXct(datetime)


png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(0,0,2,0))

# construct the plot

with(datafinal, {
  plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  
  plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  
  plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", col = c("black","red","blue"), lwd = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
  plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  
})

dev.off()
