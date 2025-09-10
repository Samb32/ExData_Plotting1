library(data.table)
dta <- fread("Data/cleaneddata.csv")
str(dta)

#save plot as png
png(filename = "plot3.png", width = 480, height = 480)

#Plot
plot(dta$date_time, dta$Sub_metering_1, 
     type = "l", 
     xaxt = "n",
     xlab = "", #remove x axis
     ylab = "Energy sub meeting")


# Add other sub-metering variables
lines(dta$date_time, dta$Sub_metering_2, col = "red")
lines(dta$date_time, dta$Sub_metering_3, col = "blue")


legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1, cex = 0.5)


#Rename axis names
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
     labels = c("Thu", "Fri", "Sat"))

dev.off()
