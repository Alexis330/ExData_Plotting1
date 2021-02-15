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


png(file = "plot2.png", width = 480, height = 480)

# construct the plot

with(datafinal, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)"))

dev.off()



