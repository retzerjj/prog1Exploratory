 setwd("~/")
 library(data.table)

  if(!file.exists("exdata-data-household_power_consumption.zip")) {
          temp <- tempfile()
          download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
          file <- unzip(temp)
          unlink(temp)
    }


   column.class <- c(rep("character",2), rep("numeric",7))
   data2 <- read.table("household_power_consumption.txt", sep=';',na.strings='?',header=TRUE, colClasses=column.class)
   data2 <- data2[as.Date(data2$Date, "%d/%m/%Y")=="2007-02-01" | as.Date(data2$Date, "%d/%m/%Y")=="2007-02-02",]  
   data2$myDate <- with(data2, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# Plot 1
   with(data2, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
   dev.copy(png, file="plot1.png", width=480, height=480); dev.off()
