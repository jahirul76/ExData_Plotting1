## Plot1.R script

source("./load_dataset.R")

#
#windows()

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(epc$Global_active_power, 
     col="red", 
     xlab="Global Active Power (killowatts)", 
     main="Global Active Power",
     )

# dev.copy(png, "plot1.png", width = 480, height = 480)

dev.off()


