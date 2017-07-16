powerdata <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
used_powerdata <- powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02", "Global_active_ power"]
png(filename = "plot1.png")
hist(used_powerdata, col = "red", freq = TRUE, main = "Global active power", xlab = "Global active power (kilowatts)")
dev.off()
