# load the data file
file<-"household_power_consumption.txt"
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE),
                          col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                          sep = ";", header = TRUE)

#time conversion
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#create the file
png(filename="Plot1.png", width=480, height=480, units ="px")

#plot the histogram
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

#close the file
dev.off()

