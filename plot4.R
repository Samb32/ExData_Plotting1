library(data.table)
dta <- fread("Data/cleaneddata.csv")
str(dta)

#save plot as png
png(filename = "plot4.png", width = 480, height = 480)

#Set row/column numbers and margins
par(mfrow = c(2, 2), mar = c(4,4,2,4))

#plot 1
plot(dta$date_time, dta$Global_active_power, 
     type = "l", 
     xaxt = "n",
     xlab = "", #remove x axis
     ylab = "Global Active Power (kilowatts)")

#plot 2
plot(dta$date_time, dta$Voltage, 
     type = "l", 
     xaxt = "n",
     xlab = "datetime", #remove x axis
     ylab = "Voltage")

#plot 3
plot(dta$date_time, dta$Sub_metering_1, 
     type = "l", 
     xaxt = "n",
     xlab = "", #remove x axis
     ylab = "Energy sub meeting")
# Add other sub-metering variables
lines(dta$date_time, dta$Sub_metering_2, col = "red")
lines(dta$date_time, dta$Sub_metering_3, col = "blue")
#Rename axis names
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
     labels = c("Thu", "Fri", "Sat"))
#Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1, 
       cex = 0.4)

#Plot 4
plot(dta$date_time, dta$Global_reactive_power, 
     type = "l", 
     xaxt = "n",
     xlab = "datetime", #remove x axis
     ylab = "Global_reactive_power")

#Reset R for plotting
dev.off()
