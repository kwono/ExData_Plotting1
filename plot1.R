## Read data from file, store in data
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

## subset data for Feb 1, 2007 through Feb 2, 2007, store in data1
data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Create a histogram
hist(data1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## copy the plot as a png file
dev.copy(png, file = "plot1.png")

## close the device
dev.off()