#The following code assumes that you have your home directory set to the location of the dataset

#Read in dataset, transform Date and Time variables and subset the dataset to dates between 2/1/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- transform(data, Time = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M"))
data <- transform(data, Date = as.Date(data$Date, "%d/%m/%Y"))
data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Create the fourth plot
par(mfcol = c(2,2))
with(data, plot(Time, Global_active_power, pch = '', xlab = '', ylab = "Global Active Power"))
lines(data$Time, data$Global_active_power)
plot(data$Time, data$Sub_metering_1, pch = '', ylab = "Energy sub metering", xlab = '')
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), cex = .75, bty = "n")
plot(data$Time, data$Voltage, pch = '', xlab = "datetime", ylab = "Voltage")
lines(data$Time, data$Voltage)
plot(data$Time, data$Global_reactive_power, pch = '', xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Time, data$Global_reactive_power)

#Save plots to a png file

