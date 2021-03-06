
rm(list = ls())

#pull in data

data <- read.table("household_power_consumption.txt",sep=";", na.strings="?", nrow=2075259, stringsAsFactors=F, header=T)

#subset for desired dates

data.S <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
rm(data)

#create timestamp variable

data.S$timestamp <- as.POSIXct(paste(as.Date(data.S$Date, format="%d/%m/%Y"), data.S$Time, sep=" "))

#Plot 2

png("plot2.png", width = 480, height = 480)


with(data.S, plot(Global_active_power ~ timestamp, 
	type = "l", xlab = "", 
	ylab = "Global Active Power (kilowatts)"))

dev.off()

