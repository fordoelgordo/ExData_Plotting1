#The following code assumes that you have your home directory set to the location of the dataset

#Read in dataset, transform Date and Time variables and subset the dataset to dates between 2/1/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- transform(data, Time = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M"))
data <- transform(data, Date = as.Date(data$Date, "%d/%m/%Y"))
data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Create first plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Copy plot to a png file 
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
