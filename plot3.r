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

# Plot 3
   with(data2, plot(myDate,Sub_metering_1,type='l',xlab="", ylab="Energy sub metering")) 
   with(data2, lines(myDate, Sub_metering_2,col="red"))
   with(data2, lines(myDate, Sub_metering_3,col="blue"))
   legend("topright",ncol=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"),lty=1)
   dev.copy(png, file="plot3.png", width=480, height=480); dev.off()

