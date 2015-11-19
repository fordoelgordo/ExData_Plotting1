#The following code assumes that you have your home directory set to the location of the dataset

#Read in and subset the data set we are working with
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- transform(data, Date = as.Date(data$Date, "%d/%m/%Y"))
data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Create first plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Copy plot to a png file 
dev.copy(png, file = "plot1.png")
dev.off()
