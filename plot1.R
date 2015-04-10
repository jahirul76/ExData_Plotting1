## Plot1.R script

source("./load_dataset.R")

##
windows()
hist(epc$Global_active_power, 
     col="red", 
     xlab="Global Active Power (killowatts)", 
     main="Global Active Power",
     breaks= 12)
dev.copy(png, "plot1.png", width = 480, height = 480, bg="white")
dev.off()


