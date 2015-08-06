# Generate Plot2
# Exploratory Data Analysis
# Project 1
#
# download data, unzip, load data and generate Plot2
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

hpc <- read.csv2("./data/household_power_consumption.txt",
                 na.strings = "?")

hpc <- transform(hpc, Global_active_power = as.numeric(Global_active_power),
                 DateTime = strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S")
                 )

hpc <- transform(hpc,gapkw = Global_active_power/1000 )

hpcFeb <- subset(hpc, DateTime >= strptime("01/02/2007","%d/%m/%Y") & 
                   DateTime < strptime("03/02/2007","%d/%m/%Y"))

png("plot2.png",width = 480, height = 480)
plot(x=hpcFeb$DateTime,y=hpcFeb$gapkw, 
        type='l',
        xlab="",
       ylab="Global Active Power (kilowatts)")

dev.off()

