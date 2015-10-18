## Programming Assignment 1 ##
## Plot 1 ##

data=read.table("power_sub.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

head(data)
lapply(names(data),class)

data$datetime=paste(data$D,data$T,sep=",")
data$datetime[5]
class(data$datetime)

#as.Date(data$datetime[1],format="%d/%m/%Y,%H:%M:%S")
data$dt=as.POSIXlt(data$datetime,format="%d/%m/%Y,%H:%M:%S")
class(data$dt)

head(data)

## plotting
plot(data$dt, data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$dt, data$Sub_metering_2,col="red")
lines(data$dt, data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"))

dev.copy(png, file="plot3.png")
dev.off()
