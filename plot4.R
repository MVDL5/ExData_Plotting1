data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data according to dates
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
x <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S")
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# Generate png
png("plot4.png")
par(mfrow = c(2,2))

# Plot 1
p1 <- subdata$Global_active_power
plot(x, p1, xbar = "", ylab = "Global Active Power", type = "l")

# Plot 2
p2 <- as.numeric(subdata$Voltage)
plot(x, p2, type = "l", xlab = "datetime", ylab = "Voltage")


# Plot 3
y1 <- as.numeric(subdata$Sub_metering_1)
y2 <- as.numeric(subdata$Sub_metering_2)
y3 <- as.numeric(subdata$Sub_metering_3)

plot(x, y1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x, y1, type = "l", col = "black")
lines(x, y2, type = "l", col = "red")
lines(x, y3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))

# Plot 4
p4 <- as.numeric(subdata$Global_reactive_power)
plot(x, p4, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
