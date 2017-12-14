# read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")


# get the relevant data, i.e. between 2007-02-01 and 2007-02-02
data_rel <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]


# convert from factor to date
date <- as.Date(data_rel$Date, format = "%d/%m/%Y")

# combine date and time
datetime <- paste(date, data_rel$Time)

# convert to POSIXct
datetime <- as.POSIXct(datetime)


png(file = "plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))
with(data_rel, {
    # plot 1 
    plot(datetime, Global_active_power, type = "l", xlab = "", 
         ylab = "Global Active Power")
    
    # plot 2
    plot(datetime, Voltage, type = "l")
    
    # plot 3
    plot(datetime, Sub_metering_1, type = "l", xlab = "",
                        ylab = "Energy sub metering")
    
    # add new red line with values of sub metering 2 to existing plot
    lines(datetime, Sub_metering_2, type = "l", col = "red")
    
    # add new blue line with values of sub metering 3 to existing plot
    lines(datetime, Sub_metering_3, type = "l", col = "blue")
    
    # add legend
    legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           bty = "n", cex = 0.75)
    
    # plot 4
    plot(datetime, Global_reactive_power, type = "l")
    
})

dev.off()