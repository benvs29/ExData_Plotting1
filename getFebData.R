# Get the February data from the large data file
#  Assumes you have the file "housefold_power_consumption.txt" in data directory
library(data.table)
df <- fread("./data/household_power_consumption.txt", sep=";", na.strings = c("?"))
library(lubridate)
df$Date <- dmy_hms(paste(df$Date, df$Time))
df$Time <- NULL
start_date <- ymd("2007-02-01")
end_date <- ymd("2007-02-03")
df_feb <- df[(df$Date >= start_date & df$Date < end_date), ]
missing <- sum(is.na(df_feb))
print(paste("Number of missing values:", missing))

# Write to CSV file for use by plotting functions
write.csv(df_feb, file="./data/feb_household.csv")