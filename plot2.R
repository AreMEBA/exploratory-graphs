

## Getting full dataset
data_full <- read.csv("C:/Users/arsene/data/exdata_2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
##check the class of variable Date, answer is "character"
class(data_full$Date)
## specify the variable Date as date
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
##check the class of variable Date, answer is "Date"
class(data_full$Date)

## Subsetting the data
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot n°2
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# creating png with specified parameters

dev.copy(png,width = 480, height = 480,'plot2.png')
dev.off()