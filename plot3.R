# Read February data (created from dataset using getFebData.R)
library(data.table)
df <- fread("./data/feb_household.csv")
df <- df[, -1]

# Create and save the plot as PNG file
png(filename = "plot3.png")
par(mar = c(5.1, 5.1, 4.1, 2.1))
dates_vec <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"), tz="UTC")
labels_vec <- weekdays(dates_vec, abbreviate = TRUE)
plot(df$Date, df$Sub_metering_1, type = "S", xaxt = "n",
     xlab="", ylab="Energy sub metering")
axis(side = 1, at = dates_vec, labels = labels_vec)
points(df$Date, df$Sub_metering_2, type = "S", col="red")
points(df$Date, df$Sub_metering_3, type = "S", col="blue")
legend("topright", legend = names(df)[6:8], col = c("black", "red", "blue"),
       lty = c(1, 1, 1), lwd = 2)
dev.off()