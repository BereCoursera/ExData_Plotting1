# get data
source("readData.r")
# create plotting device
png("plot2.png", width=480, height=480)
bkup<-par() # backup plotting options
par(bg=NA) # transparent background
# plot
plot(data$Global_active_power/500,type="l",ax=F, frame.plot=T, ylab="Global Active Power(kilowatts)", xlab="")
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"))
Axis(side=2)
dev.off()  # close device
par(bkup) # restore plotting options