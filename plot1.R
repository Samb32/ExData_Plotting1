
#Read in file as data.table
library(data.table)
dta <- fread("Data/household_power_consumption.txt")
str(dta)
names(dta)

#Convert ? to NA in each column
dta[Global_active_power == "?", .N] #25979 ? across dataset
dta[Global_active_power == "?", Global_active_power := "NA"]
dta[Global_active_power == "NA", .N]

dta[Global_reactive_power == "?", .N]
dta[Global_reactive_power == "?", Global_reactive_power := "NA"]
dta[Global_active_power == "NA", .N]

dta[Voltage == "?", .N]
dta[Voltage == "?", Voltage := "NA"]
dta[Voltage == "NA", .N]

dta[Global_intensity == "?", .N]
dta[Global_intensity == "?", Global_intensity := "NA"]
dta[Global_intensity == "NA", .N]

dta[Sub_metering_1 == "?", .N]
dta[Sub_metering_1 == "?", Sub_metering_1 := "NA"]
dta[Sub_metering_1 == "NA", .N]

dta[Sub_metering_2 == "?", .N]
dta[Sub_metering_2 == "?", Sub_metering_2 := "NA"]
dta[Sub_metering_2 == "NA", .N]

#Revise dta for specified dates (1/2/2007 - 2/2/2007)
dta[,Date] #day, month, year format
dta[, class(Date)] #character
dta[Date == "1/2/2007" | Date == "2/2/2007", .N] #2880
dta <- dta[Date == "1/2/2007" | Date == "2/2/2007"]

#Change Date column for readability
dta[, .N, .(Date,as.Date(Date,format = "%d/%m/%Y"))] #Verify as.date function 
dta[, Date := as.Date(Date,format = "%d/%m/%Y")]
dta[, head(Date)] #Verify that it worked

fwrite(dta,file = "Data/cleaneddata.csv") #create csv file of cleaned data

#Convert global_active_power to numeric for plotting
dta[, .(Global_active_power, as.numeric(Global_active_power))]
dta[, Global_active_power := as.numeric(Global_active_power)]

#save plot as png
png(filename = "plot1.png", width = 480, height = 480)

#create histogram
hist(dta$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#Reset R for plotting
dev.off()
