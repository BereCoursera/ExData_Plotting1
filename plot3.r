# get data
source("readData.r")
# create plotting device
png("plot3.png", width=480, height=480)
bkup<-par() # backup plotting options
par(bg=NA) # transparent background
# plot
plot(data$Sub_metering_1,type="l",ax=F, frame.plot=T,ylab="Energy sub metering", ylim=c(-1,40)) # offset y so 0 is visible
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3+2,col="blue") # offset y so 0 is visible
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"))
axis(2,at=c(2,10,20,30),lab=c("0", "10" ,"20","30"))
legend(1910,42,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),
       lwd=c(2.5,2.5),col=c("black","blue","red")) 
dev.off() # close device
par(bkup) # restore plotting options
