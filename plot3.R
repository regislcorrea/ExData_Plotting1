data.full = read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
str(data.full)
# 'data.frame':	2075259 obs. of  9 variables:
# $ Date                 : chr  "16/12/2006" "16/12/2006" "16/12/2006" "16/12/2006" ...
# $ Time                 : chr  "17:24:00" "17:25:00" "17:26:00" "17:27:00" ...
# $ Global_active_power  : chr  "4.216" "5.360" "5.374" "5.388" ...
# $ Global_reactive_power: chr  "0.418" "0.436" "0.498" "0.502" ...
# $ Voltage              : chr  "234.840" "233.630" "233.290" "233.740" ...
# $ Global_intensity     : chr  "18.400" "23.000" "23.000" "23.000" ...
# $ Sub_metering_1       : chr  "0.000" "0.000" "0.000" "0.000" ...
# $ Sub_metering_2       : chr  "1.000" "1.000" "2.000" "1.000" ...
# $ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

data = subset(data.full, Date == "1/2/2007" | Date == "2/2/2007")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$date_time = as.POSIXct(paste(as.Date(data$Date), data$Time))
rm(data.full)

png("plot3.png", width = 480, height = 480)
with(data, {
  plot(date_time, Sub_metering_1, type = "l", ylab="Energy sub metering")
  lines(date_time, Sub_metering_2, col = 'Red')
  lines(date_time, Sub_metering_3, col = 'Blue')})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()





with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



