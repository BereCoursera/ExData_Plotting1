# get data
source("readData.r")
# create plotting device
png("plot1.png", width=480, height=480)
bkup<-par() # backup plotting options
par(bg=NA) # transparent background
# plot
hist(data$Global_active_power/500,col="red",main="Global Active Power", ylab="Frequency", xlab="Global Active Power(kilowatts)")
dev.off()  # close device
par(bkup) # restore plotting options