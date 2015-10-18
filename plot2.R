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
plot(data$dt, data$Global_active_power,type="l",ylab="Gobal Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png")
dev.off()
