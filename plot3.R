#read data
data <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
#Concatenate data and time
data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data$Date = NULL
data$Time = NULL
#Subset required data
subset_data <- subset(data,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot3.png")
plot(x=(subset_data$DateTime),y=subset_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subset_data$DateTime),y=subset_data$Sub_metering_2,col="red")
lines(x=(subset_data$DateTime),y=subset_data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()
