# General preprocessing.

data_file<-read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE)
data_file[["Date"]]<-as.Date(data_file[["Date"]], format = "%d / %m / %Y")
data_file<-subset(data_file, data_file[["Date"]] == "2007-02-01" | data_file[["Date"]] == "2007-02-02")
data_file[["Time"]]<-as.POSIXct(paste(data_file[["Date"]], data_file[["Time"]]), format="%Y-%m-%d %H:%M:%S")


# Actual plotting.

with(data_file, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowattts)"))