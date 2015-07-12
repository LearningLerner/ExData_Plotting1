# getting data
data <- read.csv(file="data/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subsetting
set <- subset(data, Date>="2007-02-01" & Date<="2007-02-01")

# plotting
png("plot1.png", width=480, height=480)
with(set, hist(Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()
