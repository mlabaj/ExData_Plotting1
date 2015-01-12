if (!exists("power_dataset")) {
  source("_prepare_dataset.R")
}

plot(power_dataset$Date_time,
     power_dataset$Sub_metering_1,
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
lines(power_dataset$Date_time,
      power_dataset$Sub_metering_1,
      type = "l", col = "black")
lines(power_dataset$Date_time,
      power_dataset$Sub_metering_2,
      type = "l", col = "red")
lines(power_dataset$Date_time,
      power_dataset$Sub_metering_3,
      type = "l", col = "blue")
label <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", label, lwd = 2, col = c("black", "red", "blue"),
       cex = 0.7, y.intersp = 2)

dev.copy(png, "plot3.png")
dev.off()