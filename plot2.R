
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

# Create Plot 2
plot(DT$Global_active_power~DT$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save Plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

