#download file
filename <- "~/R/win-library/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
assignment <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
subset <- assignment[assignment$Date %in% c("1/2/2007","2/2/2007") ,]

#set up variables
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

#par
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot the four functions
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, 
       lwd=2.5, 
       cex = .2,
       col=c("black", "red", "blue")
       ,bty = "n")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()