if (!exists("power_dataset")) {
  source("_prepare_dataset.R")
}

plot(power_dataset$Date_time,
     power_dataset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")
dev.off()