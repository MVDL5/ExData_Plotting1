data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data according to dates
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
x <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(subdata$Sub_metering_1)
y2 <- as.numeric(subdata$Sub_metering_2)
y3 <- as.numeric(subdata$Sub_metering_3)

# Generagte png
png("plot3.png")

# Generate plot
plot(x, y1, type = "n", xlab = "", ylab = "Energy sub metering")

# Add attributes
lines(x, y1, type = "l", col = "black")
lines(x, y2, type = "l", col = "red")
lines(x, y3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))

# Close png
dev.off()