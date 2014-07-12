
# read dataset and convert date and time
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c('?'))
power$Time <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

#subset dataset
power.sub <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]

#plot Global Active Power usage over time to plot2.png
png(file = "plot2.png",width = 480, height = 480) 
plot(power.sub$Time,power.sub$Global_active_power,type="line",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()