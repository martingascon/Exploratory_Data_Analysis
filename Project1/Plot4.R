# load the data file
file<-"household_power_consumption.txt"
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE),
                          col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                          sep = ";", header = TRUE)

#time conversion
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#create the file
png(filename="Plot4.png", width=480, height=480, units ="px")

#plot in a 2x2 canvas
par(mfrow = c(2, 2))

# Plot 1,1
plot(data$Datetime, data$Global_active_power, type='l', xlab= "", ylab="Global Active Power (kilowatts)")

# plot 1,2
plot(data$Datetime, data$Voltage, type='l', xlab= "datetime", ylab="Voltage")

#plot 2,1
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type= "l", col = "red")
lines(data$Datetime, data$Sub_metering_3, type= "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#plot 2,2
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#close the file
dev.off()

