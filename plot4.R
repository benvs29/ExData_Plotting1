# Read February data (created from dataset using getFebData.R)
library(data.table)
df <- fread("./data/feb_household.csv")
df <- df[, -1]

# Create and save the plot as PNG file
png(filename = "plot4.png")
par(mfrow = c(2, 2), mar = c(5.1, 5.1, 4.1, 2.1))
# First plot
dates_vec <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"), tz="UTC")
labels_vec <- weekdays(dates_vec, abbreviate = TRUE)
plot(df$Date, df$Global_active_power, type = "S", xaxt = "n",
     xlab="", ylab="Global Active Power", cex.lab = 0.9)
axis(side = 1, at = dates_vec, labels = labels_vec)

# Second plot
plot(df$Date, df$Voltage, type = "S", xaxt = "n",
     xlab="datetime", ylab="Voltate", cex.lab = 0.9)
axis(side = 1, at = dates_vec, labels = labels_vec)

# Thirt plot
plot(df$Date, df$Sub_metering_1, type = "S", xaxt = "n",
     xlab="", ylab="Energy sub metering", cex.lab=0.9)
axis(side = 1, at = dates_vec, labels = labels_vec)
points(df$Date, df$Sub_metering_2, type = "S", col="red")
points(df$Date, df$Sub_metering_3, type = "S", col="blue")
legend("topright", legend = names(df)[6:8], col = c("black", "red", "blue"),
       lty = c(1, 1, 1), lwd = 2, cex = .8, bty="n")

# Fourth plot
plot(df$Date, df$Global_reactive_power, type = "S", xaxt = "n",
     xlab="datetime", ylab=names(df)[3], cex.lab = 0.8)
axis(side = 1, at = dates_vec, labels = labels_vec)
dev.off()