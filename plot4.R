## Plot1.R script

source("./load_dataset.R")

##
#open png grDevice
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# create 2x2 rows
par(mfrow = c(2, 2))

# Top-left
plot(epc$Datetime, epc$Global_active_power, 
     type = "l",
     col = "black",  
     xlab = "", 
     ylab = "Global active power")

# Top-right
plot(epc$Datetime, epc$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# bottom-left
plot(epc$Datetime, epc$Sub_metering_1, 
     type = "l", 
     col = "black",  
     xlab = "", 
     ylab = "Energy sub metering")

lines(epc$Datetime, epc$Sub_metering_2, col = "red")
lines(epc$Datetime, epc$Sub_metering_3, col = "blue")

legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

# bottom-right
plot(epc$Datetime, epc$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(epc)[4])

dev.off()
