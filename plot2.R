library(data.table)
dta <- fread("Data/cleaneddata.csv")
str(dta)

#Create new date_time variable
dta[, .(Date, Time, paste0(Date, " ", Time))]
dta[, .(Date, Time, paste0(Date, " ", Time), as.POSIXct(paste0(Date, " ", Time)))]
dta[, date_time := as.POSIXct(paste0(Date, " ", Time))]
dta[, date_time]

#save plot as png
png(filename = "plot2.png", width = 480, height = 480)

#Plot
plot(dta$date_time, dta$Global_active_power, 
     type = "l", 
     xaxt = "n",
     xlab = "", #remove x axis
     ylab = "Global Active Power (kilowatts)")

#Rename axis names
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
     labels = c("Thu", "Fri", "Sat"))

#reset R for plotting
dev.off()
