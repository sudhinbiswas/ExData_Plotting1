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

## Converting dates and add time to it 
date_time <- paste(as.Date(sub_data$Date), sub_data$Time)

## Create new variable name as Datetime and put it to sub_data dataset. 
sub_data$Datetime <- as.POSIXct(date_time)

## creating Plot-1
hist(sub_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving plot-1 to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()