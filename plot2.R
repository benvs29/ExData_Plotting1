# Read February data (created from dataset using getFebData.R)
library(data.table)
df <- fread("./data/feb_household.csv")
df <- df[, -1]

# Create and save the plot as PNG file
png(filename = "plot2.png")
par(mar = c(5.1, 5.1, 4.1, 2.1))
dates_vec <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"), tz="UTC")
labels_vec <- weekdays(dates_vec, abbreviate = TRUE)
plot(df$Date, df$Global_active_power, type = "S", xaxt = "n",
     xlab="", ylab="Global Active Power (kilowatts")
axis(side = 1, at = dates_vec, labels = labels_vec)
dev.off()