setwd("D:/R Files/Course-4/Week-1/data_household_power_consumption")
##code for reading data and taking subset of it
library(data.table)
DT <- as.data.table(read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                               na.strings = "?", comment.char = "", quote = '\"'))
hpc <- DT[Date=="1/2/2007" | Date=="2/2/2007"]

## Plot 1 code
hist(hpc$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col="red")
png("plot1.png", width = 480, height = 480)
dev.off()