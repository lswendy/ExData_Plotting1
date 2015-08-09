
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


# Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(DT, {plot(Global_active_power~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
            plot(Voltage~Date_time, type="l", ylab="Voltage (volt)", xlab="Date_time")
            plot(Sub_metering_1~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
            lines(Sub_metering_2~Date_time,col='Red')
            lines(Sub_metering_3~Date_time,col='Blue')
            legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8, pch=1, pt.cex = 1)
          
            plot(Global_reactive_power~Date_time, type="l", ylab="Global Rective Power (kilowatts)",xlab="Date_time")
            })

# Save it to the file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
