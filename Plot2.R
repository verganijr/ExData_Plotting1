## R script called Plot2.R that does the following:
## Build a plot with a Global_active_power variable over time 

if (!require("data.table")) {
  install.packages("data.table")
}

require("data.table")

# Load dataset
power_consumption <- read.csv("C:/Data Science/EPC/household_power_consumption.txt", header = TRUE, sep = ";")
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
df <- power_consumption[(power_consumption$Date == "2007-02-01") | (power_consumption$Date == "2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(df$timestamp, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "C:/Data Science/EPC/plot2.png", width = 480, height = 480)
dev.off()
