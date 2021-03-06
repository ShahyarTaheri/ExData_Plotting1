library(data.table)

# Download file if it is not available
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./Dataset.zip")){
  download.file(fileUrl, destfile = "./Dataset.zip")
}

# Unzip the folder if not done 
if (!file.exists("./household_power_consumption.txt")){
  unzip("./Dataset.zip")
}

# Read activity labels
data = fread("./household_power_consumption.txt",na.strings="?")
data = data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

# Transform tine
data$newTime= as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plot 
png(filename = "plot3.png",width = 480, height = 480)

with(data, plot(newTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data$newTime, data$Sub_metering_2, col="red")
lines(data$newTime, data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot to png
dev.off()  ## Don't forget to close the PNG device!