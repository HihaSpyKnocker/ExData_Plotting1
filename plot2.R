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


# plot 
with(data_rel, plot(datetime, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power (kilowatts"))


# copy plot to a PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()