source("readData.r")
voltageIncrement<-(max(data$Voltage)-min(data$Voltage))/7
reactivePwrIncrement<-(max(data$Global_reactive_power)-min(data$Global_reactive_power))/5
png("plot4.png", width=480, height=480)
bkup<-par()
par(mfrow=c(2,2))
plot(data$Global_active_power/500,type="l",ax=F, frame.plot=T, ylab="Global Active Power(kilowatts)", xlab="",cex.axis=0.5)
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.5)
Axis(side=2,cex=0.5)

plot(data$Voltage,type="l",ax=F, frame.plot=T, ylab="Voltage", xlab="datetime",cex=0.5)
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.75)
axis(2,at=0:7*voltageIncrement+min(data$Voltage),lab=ceiling(0:7*(246-230)/7+230),cex.axis=0.5)

plot(data$Sub_metering_1,type="l",ax=F, frame.plot=T,ylab="Energy sub metering", ylim=c(-1,40))
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3+2,col="blue")
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.75)
axis(2,at=c(2,10,20,30),lab=c("0", "10" ,"20","30"),cex.axis=0.5)
legend(1910,42,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),
       lwd=c(2.5,2.5),col=c("black","blue","red"),cex=0.5) 

plot(data$Global_reactive_power,type="l",ax=F, frame.plot=T, ylab="Global_reactive_power", xlab="datetime",cex=0.25)
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.75)
axis(2,at=0:5*reactivePwrIncrement+min(data$Global_reactive_power),lab=0:5/10,cex.axis=0.5)

par(bkup)
dev.off()