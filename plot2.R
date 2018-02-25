setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setClass('myDate')
raw_data <- read.csv("household_power_consumption.txt", colClasses = c("myDate", "character", "numeric", "numeric", 
                                                                       "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     sep=";", na.strings="?")
data <- raw_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%
    mutate("date_time" = as.POSIXct(strptime(paste(Date, Time, sep=" "), format="%Y-%m-%d %H:%M:%S")))

#Graph 2
png(file="plot2.png", width=480, height=480)
with(data, plot(date_time, Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab=""))
dev.off()