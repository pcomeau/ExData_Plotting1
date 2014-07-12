
# read dataset and convert date and time
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c('?'))
power$Time <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

#subset dataset
power.sub <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]


#plot Energy Sub Metering 1,2,3 over time on a single chart to file plot3.png
png(file = "plot3.png",width = 480, height = 480)
plot(power.sub$Time,power.sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power.sub,lines(Time,Sub_metering_1,col="black"))
with(power.sub,lines(Time,Sub_metering_2,col="red"))
with(power.sub,lines(Time,Sub_metering_3,col="blue"))
legend("topright", cex = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
dev.off()