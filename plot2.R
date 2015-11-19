#The following code assumes that you have your home directory set to the location of the dataset

#Read in dataset, transform Date and Time variables and subset the dataset to dates between 2/1/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- transform(data, Time = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M"))
data <- transform(data, Date = as.Date(data$Date, "%d/%m/%Y"))
data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Create the second plot
with(data, plot(Time, Global_active_power, pch = '', xlab = '', ylab = "Global Active Power (kilowatts)"))
lines(data$Time, data$Global_active_power)

#Copy plot to a png file
