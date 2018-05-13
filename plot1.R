#Get the file
dataFile <- file("C:/Users/arsene/data/exdata_2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt")

# transform to data frame and subset only data from 1 to 2 feb 2007
dataSub <- read.table(text = grep("^[1,2]/2/2007", readLines(dataFile), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
dataSub

# Generating Plot n°1 with specified colour name in red and other parameters
hist(dataSub$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

# creating png with specified parameters

dev.copy(png,width = 480, height = 480,'plot1.png')
dev.off()