library(sqldf)
## Reads the data file and selects the dates 1/2/2007 and 2/2/2007
DF <- read.csv.sql("household_power_consumption.txt", sep = ";", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"')

# Merges Date and Time to datetime
DF$datetime <- paste(DF$Date, DF$Time)

## Converts datetime to Date and Time format
DF$datetime <- strptime(DF$datetime, format = '%d/%m/%Y %H:%M:%S')

## Splits the plot into 2 by 2 frame
par(mfrow = c(2,2))

## First plot
plot(DF$datetime, DF$Global_active_power, type = "l", ylab = "Global Active Power", xlab = '')

## Second Plot
plot(DF$datetime, DF$Voltage, type = "l", ylab = "Voltage", xlab = 'datetime')

## Third Plot
plot(DF$datetime, DF$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = '')
lines(DF$datetime, DF$Sub_metering_2, type = "l", col = "red")
lines(DF$datetime, DF$Sub_metering_3, type = "l", col = "blue")
legend('topright', colnames(DF)[c(7,8,9)], col = c('black', 'red', 'blue'), lty = 1)

## Fourth Plot
plot(DF$datetime, DF$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = 'datetime')

## Copies the plots to PNG
dev.copy(png, 'plot4.png')
dev.off()

