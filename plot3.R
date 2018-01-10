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

##Plot 3 code
with(hpc, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(hpc, lines(Time, Sub_metering_2, type = "l", col="red"))
with(hpc, lines(Time, Sub_metering_3, type = "l", col="blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()