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

# Time transformation
data$newTime= as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plot
with(data, plot(newTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Save plot to png
dev.copy(png, file = "./plot2.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!