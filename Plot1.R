## R script called Plot1.R that does the following:
## Build a histogram that counts the frequency of Global_active_power variable

if (!require("data.table")) {
  install.packages("data.table")
}

require("data.table")

# Load dataset
power_consumption <- read.csv("C:/Data Science/EPC/household_power_consumption.txt", header = TRUE, sep = ";")
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
df <- power_consumption[(power_consumption$Date == "2007-02-01") | (power_consumption$Date == "2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
hist(df$Global_active_power, main = paste("Global Active Power"), col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "C:/Data Science/EPC/plot1.png", width = 480, height = 480)
dev.off()
