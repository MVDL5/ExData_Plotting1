# Load data into environment
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data according to dates
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Make Global_active_power numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

x <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S")
y <- subdata$Global_active_power

# Generate png
png("plot2.png")

#subdata$Date <- weekdays(subdata$Date)
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power")

# Close png
dev.off()