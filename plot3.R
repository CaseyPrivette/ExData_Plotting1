## Construct plot 3 of programming assignment 1 for Coursera Exploratory
## Data Analysis course

# read data into R

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="project.zip")
unzip("project.zip")
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";",
                   colClasses="character",
                   check.names=TRUE)

# take only subset of date where date = 1/2/2007 or 2/2/2007
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# convert applicable columns to numeric
data[3:9] <- sapply(data[3:9],as.numeric)

# create new variable DateTime by combining date and time
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# open png file for histogram
png("plot3.png", 
    width=480, 
    height=480, 
    units="px", 
    bg="transparent")

# create line plot of 3 levels of sub metering over 2 days
plot(data$DateTime, 
     data$Sub_metering_1, 
     type="n", 
     xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=leg.txt, lwd=1, col=c("black", "red", "blue"))

dev.off()