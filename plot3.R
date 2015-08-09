
setwd("C:/Courses/Exploratory Data Analysis_NotSync/Project1")

# Read the input dataset
dt <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

# Subset the original data (only ranging between 2007-02-01 and 2007-02-02)
DT <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# to date/time classes 
date_time <- paste(as.Date(DT$Date), DT$Time)
DT$Date_time <- as.POSIXct(date_time)

# Create Plot 3
with(DT, {
        plot(Sub_metering_1~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
        })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()