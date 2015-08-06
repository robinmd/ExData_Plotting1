# Generate Plot1
# Exploratory Data Analysis
# Project 1
#
# download data, unzip, load data and generate Plot1
#
if(!file.exists("./data")){
  dir.create("./data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileD <- "./data/household_power_consumption.zip"
if(!file.exists(fileD)){
  download.file(fileUrl,destfile=fileD,mode="wb")
}

unzip(fileD, exdir="./data")

hpc <- read.csv2("./data/household_power_consumption.txt")

