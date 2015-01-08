## Construct plot 1 of programming assignment 1

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

# open png file for histogram
png("plot1.png", 
    width=480, 
    height=480, 
    units="px", 
    bg="transparent")

# create histogram of Global_active_power in device
hist(data2$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()