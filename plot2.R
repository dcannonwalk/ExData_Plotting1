powerdata <- read.table("household_power_consumption.txt", sep = ";",
                        na.strings = "?", header = TRUE, stringsAsFactors = FALSE, dec = ".")
used_powerdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(used_powerdata$Date, used_powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- used_powerdata$Global_active_power
png(filename = "plot2.png")
plot(datetime, globalActivePower, type = "l")
dev.off()