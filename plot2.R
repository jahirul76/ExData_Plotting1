## Plot1.R script

source("./load_dataset.R")

##
windows()
plot(epc$Datetime, epc$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)") 
dev.copy(png, "plot2.png", width = 480, height = 480 )
dev.off()
