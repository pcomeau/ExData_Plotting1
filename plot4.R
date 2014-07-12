
# read dataset and convert date and time
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c('?'))
power$Time <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

#subset dataset
power.sub <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]

#Create 4 charts on a single 2x2 canvas to file plot4.png:
# Global Active Power usage over time
# Measurment of Voltage over time
# Energy Sub Metering 1,2,3 over time
# Global Reactive Power over time
png(file = "plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))
plot(power.sub$Time,power.sub$Global_active_power,type="line",xlab="",
     ylab="Global Active Power")
plot(power.sub$Time,power.sub$Voltage,type="line",xlab="datetime",
     ylab="Voltage")
plot(power.sub$Time,power.sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power.sub,lines(Time,Sub_metering_1,col="black"))
with(power.sub,lines(Time,Sub_metering_2,col="red"))
with(power.sub,lines(Time,Sub_metering_3,col="blue"))
legend("topright", cex = 1, col = c("black", "red", "blue"),bty="n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
plot(power.sub$Time,power.sub$Global_reactive_power,type="line",xlab="datetime",
     ylab="Global_reactive_power")
dev.off()
par(mfrow = c(1, 1))