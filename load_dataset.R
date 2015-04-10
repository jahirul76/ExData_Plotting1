## Purpose of this script to loads 'Electric power consumption' dataset in a 
## data table called 'epc'. 
## This script assumes 'household_power_consumption.txt' file already exists 
## in the ./data directory
##

library(data.table)
library(dplyr)


if(length(list.files("./data/", pattern="household_power_consumption.txt") ) == 1) {
  
  #Date: Date in format dd/mm/yyyy
  #Time: time in format hh:mm:ss   
  #Global_active_power: household global minute-averaged active power (in kilowatt)
  #Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
  #Voltage: minute-averaged voltage (in volt)
  #Global_intensity: household global minute-averaged current intensity (in ampere)
  #Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
  #Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
  #Sub_metering_3: energy sub-metering No
  
  
  
  cls <- c(Date="character"
           , Time="character"
           , Global_active_power="numeric"
           , Global_reactive_power="numeric"
           , Voltage="numeric"
           , Global_intensity="numeric"
           , Sub_metering_1 = "numeric"
           , Sub_metering_2 = "numeric"
           , Sub_metering_3 = "numeric"
  ) 
  
  df <- read.csv("./data/household_power_consumption.txt"
                 , sep = ";"
                 , nrows=69600                              
                 , colClasses=cls
                 , na.strings=c("NA","N/A","","?")
  )
  
} else  {
  
  print(paste("Something went wrong. Couldn't find the dataset in the ", 
              getwd(), "/data directory", sep=""))
}

## convert to data.table
epc <- tbl_df(df)


# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# 
# add new Datetime column to dataset
# filter out extra data leaving observations required for excercise only.

epc %>% 
  mutate(Datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>%  
  filter(Datetime >= as.POSIXct("2007-02-01"),
         Datetime < as.POSIXct("2007-02-03") 
  ) -> epc

rm("df")
