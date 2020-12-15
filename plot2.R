library(data.table)


x = fread("household_power_consumption.txt")


# clean the data


x$DateTime = paste(x$Date,x$Time,sep="_")
z = strptime(x$DateTime[1:2075259],"%d/%m/%Y_%H:%M:%S")

start = strptime("2007-02-01", "%Y-%m-%d")
end = strptime("2007-02-03", "%Y-%m-%d")

index = (z > start) & (z < end)
x = x[index]

x$Global_active_power = as.numeric(x$Global_active_power)
x$Global_reactive_power = as.numeric(x$Global_reactive_power)
x$Voltage = as.numeric(x$Voltage)
x$Global_intensity = as.numeric(x$Global_intensity)
x$Sub_metering_1 = as.numeric(x$Sub_metering_1)
x$Sub_metering_2 = as.numeric(x$Sub_metering_2)

# make the plot

png("plot2.png", width=480, height=480)
plot(z[index],x$Global_active_power, type = "l",
	xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()





