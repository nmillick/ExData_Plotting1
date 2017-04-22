#download file
filename <- "~/R/win-library/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
assignment <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
subset <- assignment[assignment$Date %in% c("1/2/2007","2/2/2007") ,]

#tidy active power & date cols, plot as line
png("plot2.png", width = 480, height = 480)
Global_active_power <- as.numeric(subset$Global_active_power)
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)")

dev.off()

