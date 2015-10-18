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
par(mfrow=c(2,2),mar=c(5,5,2,1),oma=c(0,0,0,0))
plot(data$dt, data$Global_active_power,type="l",ylab="Gobal Active Power",xlab="")

plot(data$dt, data$V,type="l",ylab="Voltage",xlab="datetime")

plot(data$dt, data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$dt, data$Sub_metering_2,col="red")
lines(data$dt, data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),box.lwd="0",cex=0.7,inset=c(0.22,0.01))

plot(data$dt, data$Global_reactive_power,type="l",ylab="Gobal_reactive_power",xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()

