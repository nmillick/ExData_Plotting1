#download file
filename <- "~/R/win-library/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
assignment <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
subset <- assignment[assignment$Date %in% c("1/2/2007","2/2/2007") ,]

#change to numeric, create hist
png("plot1.png", width = 480, height = 480)
Global_active_power <- as.numeric(subset$Global_active_power)
hist(Global_active_power,
     col = 2,
     main = "Global Active Power",
     xlab = "Global Active Power(Kilowatts)" )

dev.off()

