library(sqldf)
## Reads the data file and selects the dates 1/2/2007 and 2/2/2007
DF <- read.csv.sql("household_power_consumption.txt", sep = ";", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"')

# Merges Date and Time to datetime
DF$datetime <- paste(DF$Date, DF$Time)

## Converts datetime to Date and Time format
DF$datetime <- strptime(DF$datetime, format = '%d/%m/%Y %H:%M:%S')

## Plots the line
plot(DF$datetime, DF$Global_active_power, type = "l", ylab = "Global Active Power  (kilowatts)", xlab = '')

## Copies the plot to PNG
dev.copy(png, 'plot2.png')
dev.off()