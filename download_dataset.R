## 
## This script download 'Electric power consumption' dataset required 
## for completing Ploting assignment 1
## 
## 1) It creates data directory if one doesn't already exists.
## 2) Download dataset from this url (if it doesnt exists)
##     https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## 3) Extract the file inside to data data directory.
## 

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dsFile <- "household_power_consumption.txt"


if(!file.exists("./data") ) {
  dir.create("./data")
}

# check if dataset file alreay exist in the data directory
# if not exist, download and extract the file
#
file <- list.files("./data", pattern=dsFile)
if(length(file) != 1) {
  
  temp <- tempfile()
  
  download.file(fileUrl, temp)

  unzip(temp, exdir="./data")
  unlink(temp)
  
  dateDownloaded <- date()
  print(dateDownloaded)

}

file <- list.files("./data", pattern=dsFile)
ifelse(file == "household_power_consumption.txt", 
       print(paste("Dataset downloaded to ", getwd(), "/", file, sep="")),
       print("Something went wrong: data set file missing!")
       )
