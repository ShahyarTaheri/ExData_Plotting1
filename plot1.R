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

#png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save plot to png
dev.copy(png, file = "./plot1.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!