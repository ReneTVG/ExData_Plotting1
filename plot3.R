library(sqldf)
## Reads the data file and selects the dates 1/2/2007 and 2/2/2007
DF <- read.csv.sql("household_power_consumption.txt", sep = ";", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"')

# Merges Date and Time to datetime
DF$datetime <- paste(DF$Date, DF$Time)

## Converts datetime to Date and Time format
DF$datetime <- strptime(DF$datetime, format = '%d/%m/%Y %H:%M:%S')

## Plots the lines
plot(DF$datetime, DF$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = '')
lines(DF$datetime, DF$Sub_metering_2, type = "l", col = "red")
lines(DF$datetime, DF$Sub_metering_3, type = "l", col = "blue")

## Adds the legends
legend('topright', colnames(DF)[c(7,8,9)], col = c('black', 'red', 'blue'), lty = 1)

## Copies the plots to PNG
dev.copy(png, 'plot3.png')
dev.off()