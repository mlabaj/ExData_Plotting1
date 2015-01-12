if (!exists("power_dataset")) {
  source("_prepare_dataset.R")
}

op <- par(mfcol = c(2,2),  mar = c(6,6,1,0))
par(cex = 0.7)

# plot 1 (plot2.R)
plot(power_dataset$Date_time,
     power_dataset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# plot 2 (plot3.R)
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
       cex = 0.7, y.intersp = 2, bty = "n")


# plot 3
plot(power_dataset$Date_time,
     power_dataset$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

# plot 4
plot(power_dataset$Date_time,
     power_dataset$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

par(op)

dev.copy(png, "plot4.png")
dev.off()
