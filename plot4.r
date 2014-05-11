# get data
source("readData.r")

# variables for scaling axis labels [bin into 7 voltage/5 power values]
voltageIncrement<-(max(data$Voltage)-min(data$Voltage))/7
reactivePwrIncrement<-(max(data$Global_reactive_power)-min(data$Global_reactive_power))/5

# create plotting device
png("plot4.png", width=480, height=480)
bkup<-par() # backup plotting options
par(bg=NA) # transparent background
par(mfrow=c(2,2)) # 2 X 2 plotting panels

# plot 1 
plot(data$Global_active_power/500,type="l",ax=F, frame.plot=T, ylab="Global Active Power(kilowatts)", xlab="",cex.axis=0.5)
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.5)
Axis(side=2,cex=0.5)

# plot 2 
plot(data$Voltage,type="l",ax=F, frame.plot=T, ylab="Voltage", xlab="datetime",cex=0.5)
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.75)
# the expresion at=0:7*voltageIncrement+min(data$Voltage) bins the data in 7 classes
# lab=ceiling(0:7*(246-230)/7+230) produces the 7 numbers within 230 and 246
axis(2,at=0:7*voltageIncrement+min(data$Voltage),lab=ceiling(0:7*(246-230)/7+230),cex.axis=0.5)

# plot 3 
plot(data$Sub_metering_1,type="l",ax=F, frame.plot=T,ylab="Energy sub metering", ylim=c(-1,40))
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3+2,col="blue")
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.75)
axis(2,at=c(2,10,20,30),lab=c("0", "10" ,"20","30"),cex.axis=0.5)
legend(1910,42,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),
       lwd=c(2.5,2.5),col=c("black","red","blue"),cex=0.5) 

# plot 4 
plot(data$Global_reactive_power,type="l",ax=F, frame.plot=T, ylab="Global_reactive_power", xlab="datetime",cex=0.25)
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"),cex.axis=0.75)
# the expresion at=0:5*reactivePwrIncrement+min(data$Global_reactive_power) simlarly bins the reactive power values into 5 classes
# lab=0:5/10 generates the 5 numbers between 0.1 and 0.5 with an increment of 0.1
axis(2,at=0:5*reactivePwrIncrement+min(data$Global_reactive_power),lab=0:5/10,cex.axis=0.5)

par(bkup) # restore plotting options
dev.off() # close device