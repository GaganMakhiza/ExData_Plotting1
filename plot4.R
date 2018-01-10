setwd("D:/R Files/Course-4/Week-1/data_household_power_consumption")
##code for reading data and taking subset of it
library(data.table)
DT <- as.data.table(read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                               na.strings = "?", comment.char = "", quote = '\"'))
hpc <- DT[Date=="1/2/2007" | Date=="2/2/2007"]

##changing time and date format
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Time <- as.POSIXct(datetime)

##Plot 4 Code
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpc,{
    plot(Global_active_power~Time, type="l", 
         ylab = "Global Active Power", xlab="")
    plot(Voltage~Time, type="l", 
         ylab = "Voltage", xlab="datetime")
    plot(Sub_metering_1~Time, type="l", 
         ylab = "Energy sub metering", xlab="")
    lines(Sub_metering_2~Time, col="red")
    lines(Sub_metering_3~Time, col="blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1,  bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Time, type="l", 
         ylab = "Global Reactive Power", xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
