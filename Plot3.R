#download file
filename <- "~/R/win-library/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
assignment <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
subset <- assignment[assignment$Date %in% c("1/2/2007","2/2/2007") ,]

#set up data fields
Sub_Metering1 <- as.numeric(subset$Sub_metering_1)
Sub_Metering2 <- as.numeric(subset$Sub_metering_2)
Sub_Metering3 <- as.numeric(subset$Sub_metering_3)
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot function with labels
png("plot3.png", width = 480, height = 480)
plot(datetime, Sub_Metering1, type="l", ylab="Energy Sub Metering", xlab="")

#Add lines & legend
lines(datetime, Sub_Metering2, type="l", col="red")
lines(datetime, Sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       lwd=2.5, 
       cex = .5,
       col=c("black", "red", "blue"))

dev.off()
