# getting data
data <- read.csv(file="data/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- as.POSIXct(paste(data$Date, data$Time, sep = ":"), format="%d/%m/%Y:%H:%M:%S")

# subsetting
set <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
set <- set[complete.cases(set$Time),]

# plotting
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# plot 1,1
with(set, plot(Time, Global_active_power, type="line", ylab="Global Active Power"))

# plot 1,2
with(set, plot(Time, Voltage, type="line", ylab="Voltage"))

# plot 2,1
with(set, plot(Time, Sub_metering_1 , ylab="Energy sub metering", type="line", col="black"))
with(set, points(Time, Sub_metering_2, type="line", col="red"))
with(set, points(Time, Sub_metering_3, type="line", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))

# plot 2,2
with(set, plot(Time, Global_reactive_power, type="line"))


dev.off()
