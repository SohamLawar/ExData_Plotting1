#read data
data <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
#Concatenate data and time
data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data$Date = NULL
data$Time = NULL
#Subset required data
subset_data <- subset(data,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot2.png")
plot(x=(subset_data$DateTime),y=subset_data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
