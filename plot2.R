## Original data should be unarchived to working directory

## Reading data
source_data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")
source_data$Date <- as.Date(source_data$Date, format="%d/%m/%Y")

## Subsetting data
data <- subset(source_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(source_data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Creating plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
