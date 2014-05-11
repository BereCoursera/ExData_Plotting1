source("readData.r")
png("plot2.png", width=480, height=480)
plot(data$Global_active_power/500,type="l",ax=F, frame.plot=T, ylab="Global Active Power(kilowatts)", xlab="")
axis(1,at=c(0,1500,2900),lab=c("Thu", "Fri" ,"Sat"))
Axis(side=2)
dev.off()