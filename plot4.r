# General preprocessing.

data_file<-read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE)
data_file[["Date"]]<-as.Date(data_file[["Date"]], format = "%d / %m / %Y")
data_file<-subset(data_file, data_file[["Date"]] == "2007-02-01" | data_file[["Date"]] == "2007-02-02")
data_file[["Time"]]<-as.POSIXct(paste(data_file[["Date"]], data_file[["Time"]]), format="%Y-%m-%d %H:%M:%S")


# Actual plotting.

par(mfrow=c(2,2))
with(data_file, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowattts)"))
with(data_file, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
 
with(data_file, plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", ))
lines(data_file[["Time"]], data_file[["Sub_metering_2"]], col = "red")
lines(data_file[["Time"]], data_file[["Sub_metering_3"]], col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))
 
with(data_file, plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
 
