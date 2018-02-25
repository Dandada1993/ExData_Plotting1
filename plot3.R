setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setClass('myDate')
raw_data <- read.csv("household_power_consumption.txt", colClasses = c("myDate", "character", "numeric", "numeric", 
                                                                       "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     sep=";", na.strings="?")
data <- raw_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%
    mutate("date_time" = as.POSIXct(strptime(paste(Date, Time, sep=" "), format="%Y-%m-%d %H:%M:%S")))

#Graph 3
png(file="plot3.png", width=480, height=480)
with(data, plot(date_time, Sub_metering_1, type="l", ylab="Energy sub metering"))
with(data, lines(date_time, Sub_metering_2, col="red"))
with(data, lines(date_time, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd=1)
dev.off()