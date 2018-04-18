## read whole data
whole_data <- read.csv("./Data/household_power_consumption.txt", 
                       sep=';', stringsAsFactors=F, na.strings="?", nrows=2075259, header=T,
                       check.names=F, comment.char="", quote='\"')

## convert the Date variable to Date classes
whole_data$Date <- as.Date(whole_data$Date, format="%d/%m/%Y")

## Subsetting the data
sub_data <- subset(whole_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Delete the previous raw dataset
rm(whole_data)

## Converting dates and add time data to data_time variable 
date_time <- paste(as.Date(sub_data$Date), sub_data$Time)

## Create new variable name as Datetime and put date_time data to sub_data dataset under Datetime variable 
sub_data$Datetime <- as.POSIXct(date_time)

## creating Plot-3 with transparent Background
par(bg = "transparent")
with(sub_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving plot-3 to png file
dev.copy(png, file="plot3.png", height=504, width=504)
dev.off()
