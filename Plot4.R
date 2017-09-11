## R script called Plot4.R that does the following:
## Build plots of Global Active Power, Sub-Metered Power, Voltage and Global Reactive Power over time.

if (!require("data.table")) {
  install.packages("data.table")
}

require("data.table")

# Load dataset
power_consumption <- read.csv("C:/Data Science/EPC/household_power_consumption.txt", header = TRUE, sep = ";")
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
df <- power_consumption[(power_consumption$Date == "2007-02-01") | (power_consumption$Date == "2007-02-02"),]
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))

plot(df$timestamp, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(df$timestamp, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(df$timestamp, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$timestamp, df$Sub_metering_2, col = "red")
lines(df$timestamp, df$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3"), lty = c(1,1), bty = "n", cex = .5)

plot(df$timestamp, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "C:/Data Science/EPC/plot4.png", width = 480, height = 480)
dev.off()
