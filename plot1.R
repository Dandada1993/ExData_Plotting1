setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setClass('myDate')
raw_data <- read.csv("household_power_consumption.txt", colClasses = c("myDate", "character", "numeric", "numeric", 
                                                                       "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     sep=";", na.strings="?")
data <- raw_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%
    mutate("date_time" = as.POSIXct(strptime(paste(Date, Time, sep=" "), format="%Y-%m-%d %H:%M:%S")))

#Graph 1
png(file="plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()