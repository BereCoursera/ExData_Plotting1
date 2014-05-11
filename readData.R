#read few lines
# todo: optimze this code to read conditionally and cache data
# dt<-read.table("household_power_consumption.txt", sep=";", nrow=5,head=T)
# dt$Date<-as.Date(dt$Date)
# dt$Time<-strptime(dt$Time,"%H:%M:%S")
# cls<-sapply(dt, class)

#read whole data
data<-read.table("household_power_consumption.txt", sep=";",head=T,comment.char="")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
startDt<-as.Date("2007-02-01", "%Y-%m-%d")
endDt<-as.Date("2007-02-02", "%Y-%m-%d")
use<-data$Date >= startDt & data$Date <= endDt
data<-data[use,]
data$Time<-strptime(data$Time,"%H:%M:%S")

#set column types
for (i in 3:9) { data[,i]<-as.numeric(data[,i]) }