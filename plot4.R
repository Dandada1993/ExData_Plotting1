setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setClass('myDate')
raw_data <- read.csv("household_power_consumption.txt", colClasses = c("myDate", "character", "numeric", "numeric", 
                                                                       "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     sep=";", na.strings="?")
data <- raw_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%
    mutate("date_time" = as.POSIXct(strptime(paste(Date, Time, sep=" "), format="%Y-%m-%d %H:%M:%S")))

#Graph 4
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(date_time, Global_active_power, type="l", ylab="Global Active Power", xlab=""))
with(data, plot(date_time, Voltage, type="l", ylab="Voltage"))
with(data, plot(date_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(date_time, Sub_metering_2, col="red"))
with(data, lines(date_time, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd=1)
with(data, plot(date_time, Global_active_power, type="l"))
dev.off()