library(sqldf)
## Reads the data file and selects the dates 1/2/2007 and 2/2/2007
DF <- read.csv.sql("household_power_consumption.txt", sep = ";", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"')

# Converts the dates and time to Date and Time format
DF$Date <- strptime(DF$Date, format = '%d/%m/%Y')
DF$Time <- strptime(DF$Time, format = '%H:%M:%S')

## Plots the histogram
hist(DF$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

## Copies the plot to PNG file
dev.copy(png, 'plot1.png')
dev.off()