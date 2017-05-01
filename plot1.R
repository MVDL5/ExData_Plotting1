library(lubridate)

# Load data into environment
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data acoording to dates

subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Generate png
png("plot1.png")

# Make histogram
hist(as.numeric(subdata$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Close png
dev.off()