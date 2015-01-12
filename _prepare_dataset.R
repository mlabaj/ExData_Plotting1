library(lubridate)

dataset.file.name <- "household_power_consumption.txt"
zip.file.name    <- "household_power_consumption.zip"

if (!file.exists(dataset.file.name)) {
  if (!file.exists(zip.file.name)) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile = zip.file.name, mode = "wb")
  }
  unzip(zip.file.name)    
}

power_dataset <- read.csv(dataset.file.name, sep = ";")

# convert date and filter
power_dataset$Date <- dmy(power_dataset$Date)
power_dataset <- power_dataset[power_dataset$Date == ymd("2007-02-01") | power_dataset$Date == ymd("2007-02-02"),]

# convert time
power_dataset$Time <- hms(power_dataset$Time)

# create datetime
power_dataset$Date_time <- power_dataset$Date + power_dataset$Time

power_dataset$Global_active_power <- as.numeric(as.character(power_dataset$Global_active_power))
power_dataset$Global_reactive_power <- as.numeric(as.character(power_dataset$Global_reactive_power))
power_dataset$Sub_metering_1 <- as.numeric(as.character(power_dataset$Sub_metering_1))
power_dataset$Sub_metering_2 <- as.numeric(as.character(power_dataset$Sub_metering_2))
power_dataset$Sub_metering_3 <- as.numeric(as.character(power_dataset$Sub_metering_3))
power_dataset$Voltage <- as.numeric(as.character(power_dataset$Voltage))