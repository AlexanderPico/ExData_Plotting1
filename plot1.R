## Programming Assignment 1 ##
## Plot 1 ##

data=read.table("power_sub.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

head(data)
lapply(names(data),class)

data$datetime=paste(data$D,data$T,sep=",")
data$datetime[1]

#as.Date(data$datetime[1],format="%d/%m/%Y,%H:%M:%S")
data$dt=as.POSIXlt(data$datetime,format="%d/%m/%Y,%H:%M:%S")
class(data$dt)

head(data)

## plotting
?hist
hist(data$Global_a,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
