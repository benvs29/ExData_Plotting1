# Read February data (created from dataset using getFebData.R)
library(data.table)
df <- fread("./data/feb_household.csv")
df <- df[, -1]

# Create and save the plot as PNG file
png(filename = "plot1.png")
par(mar = c(5.1, 5.1, 4.1, 2.1))
hist(df_feb$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red", ylim=c(0, 1300))
dev.off()
