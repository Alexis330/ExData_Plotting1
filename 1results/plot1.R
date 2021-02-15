

# read data
fileDir <- "household_power_consumption.txt"
data <- read.table(fileDir, header = TRUE, sep = ";", na.strings = "?")

# change date format to year-month-date
dateYMD <- strptime(data$Date, format = "%d/%m/%Y")
# convert dateYMD to format yyyy-mm-dd
data$Date <- as.Date(dateYMD)

# subset data
datafinal <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

png(file = "plot1.png", width = 480, height = 480)

# construct the plot

hist(datafinal$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

dev.off()















