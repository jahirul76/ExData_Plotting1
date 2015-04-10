## Plot1.R script

source("./load_dataset.R")

#open png grDevice
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(epc$Datetime, epc$Global_active_power, 
     type = "l", 
     xlab="", 
     ylab = "Global Active Power (kilowatts)") 

dev.off()
