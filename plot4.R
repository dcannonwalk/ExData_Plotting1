powerdata <- read.table("household_power_consumption", sep = ";",
                        na.strings = "?", header = TRUE, stringsAsFactors = FALSE, dec = ".")
used_powerdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(used_powerdata$Date, used_powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(datetime, used_powerdata$Global_active_power, type = "l", xlab = "", ylab = "Global active power")
plot(datetime, used_powerdata$Voltage, type = "l", ylab = "Voltage")
plot(datetime, used_powerdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, used_powerdata$Sub_metering_2, col = "red")
lines(datetime, used_powerdata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))
plot(datetime, used_powerdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power")
dev.off()