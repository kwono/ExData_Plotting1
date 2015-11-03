## Read data from file, store in data
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

## subset data for Feb 1, 2007 through Feb 2, 2007, store in data1
data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## convert data1$Date using as.Date
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

## combine vars Date and Time, convert to time
data1 <- mutate(data1, Date_time = paste(Date, Time))
data1$Date_time <- strptime(data1$Date_time, "%Y-%m-%d %H:%M:%S")

## construct the plots
par(mfrow = c(2, 2))
with(data1, {
    plot(Date_time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    plot(Date_time, Voltage, type = "l", ylab = "Voltage", xlab = "")
    plot(Date_time, Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "")
    lines(Date_time, Sub_metering_2, col = "red")
    lines(Date_time, Sub_metering_3, col = "blue")
    plot(Date_time, Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "")})

## copy the plot as a png file
dev.copy(png, file = "plot4.png")

## close the device
dev.off()