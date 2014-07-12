
# read dataset and convert date and time
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c('?'))
power$Time <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

#subset dataset
power.sub <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]

#histogram of Global Active Power to plot1.png
png(file = "plot1.png",width = 480, height = 480) 
hist(power.sub$Global_active_power,col="orangered2",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

