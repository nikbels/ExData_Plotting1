# General preprocessing.

data_file<-read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE)
data_file[["Date"]]<-as.Date(data_file[["Date"]], format = "%d / %m / %Y")
data_file<-subset(data_file, data_file[["Date"]] == "2007-02-01" | data_file[["Date"]] == "2007-02-02")
data_file[["Time"]]<-as.POSIXct(paste(data_file[["Date"]], data_file[["Time"]]), format="%Y-%m-%d %H:%M:%S")


# Actual plotting.

with(data_file, plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", ))
lines(data_file[["Time"]], data_file[["Sub_metering_2"]], col = "red")
lines(data_file[["Time"]], data_file[["Sub_metering_3"]], col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))