# getting data
data <- read.csv(file="data/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- as.POSIXct(paste(data$Date, data$Time, sep = ":"), format="%d/%m/%Y:%H:%M:%S")

# subsetting
set <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
set <- set[complete.cases(set$Time),]

# plotting

png("plot3.png", width=480, height=480)

with(set, plot(Time, Sub_metering_1 , ylab="Energy sub metering", type="line", col="black"))
with(set, points(Time, Sub_metering_2, type="line", col="red"))
with(set, points(Time, Sub_metering_3, type="line", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))


dev.off()
