## Read data from file, store in data
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

## subset data for Feb 1, 2007 through Feb 2, 2007, store in data1
data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## convert data1$Date using as.Date
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

## combine vars Date and Time, convert to time
data1 <- mutate(data1, Date_time = paste(Date, Time))
data1$Date_time <- strptime(data1$Date_time, "%Y-%m-%d %H:%M:%S")

plot(data1$Date_time, data1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## copy the plot as a png file
dev.copy(png, file = "plot2.png")

## close the device
dev.off()