# read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")


# get the relevant data, i.e. between 2007-02-01 and 2007-02-02
data_rel <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]


# plot histogram
hist(data_rel$Global_active_power, main = "Global Active Power", col = "red",  
     xlab = "Global Active Power (kilowatts)")


# copy plot to a PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()