if (!exists("power_dataset")) {
  source("_prepare_dataset.R")
}

hist(power_dataset$Global_active_power,
     col = "red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.copy(png, "plot1.png")
dev.off()