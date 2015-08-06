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

hpc <- read.csv2("./data/household_power_consumption.txt",
                 na.strings = "?")

hpc <- transform(hpc, Global_active_power = as.numeric(Global_active_power),
                 Date = as.Date(Date, "%d/%m/%Y"))

hpc <- transform(hpc,gapkw = Global_active_power/1000 )

hpcFeb <- subset(hpc, Date >= as.Date("01/02/2007","%d/%m/%Y") & 
                   Date <= as.Date("02/02/2007","%d/%m/%Y"))

png("plot1.png",width = 480, height = 480)
hist(hpcFeb$gapkw, col="red",
     xlim =c(0,8),
     ylim =c(0,1200),
     #     axis(side=1, at=c(0,2,4,6)),
     #     breaks=16,
     xaxt="n",
     breaks=seq(0,8,.5),
     #     breaks=16,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
axis(1, at=seq(0,6,2))
dev.off()

