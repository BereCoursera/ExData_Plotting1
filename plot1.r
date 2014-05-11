source("readData.r")
png("plot1.png", width=480, height=480)
hist(data$Global_active_power/500,col="red",main="Global Active Power", ylab="Frequency", xlab="Global Active Power(kilowatts)")
dev.off()