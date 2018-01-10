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

##plot 2 code
plot(hpc$Time, hpc$Global_active_power, ylab = "Global Active Power (kilowatts)", 
     xlab = "", type = "l", )
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()