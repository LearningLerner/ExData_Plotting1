# getting data
data <- read.csv(file="data/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- as.POSIXct(paste(data$Date, data$Time, sep = ":"), format="%d/%m/%Y:%H:%M:%S")

# subsetting
set <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
set <- set[complete.cases(set$Time),]

# plotting
png("plot2.png", width=480, height=480)
with(set, plot(Time, Global_active_power, type="line", ylab="Global Active Power (kilowatts)"))
dev.off()
