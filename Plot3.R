## R script called Plot3.R that does the following:
## Build a plot of energy use for each sub metered zone over time

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
df <- transform(df, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(df$timestamp, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$timestamp, df$Sub_metering_2, col = "red")
lines(df$timestamp, df$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3"), lty = c(1,1), lwd=c(1,1))
dev.copy(png, file = "C:/Data Science/EPC/plot3.png", width = 480, height = 480)
dev.off()
