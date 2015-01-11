# This code assumes the dataset file household_power_consumption.txt is present in the current directory

loaddata <- function(filename = "household_power_consumption.txt"){
  dfr <- read.csv(filename, na.strings='?', sep=';', stringsAsFactors=F)
  dfr$Date <- as.Date(dfr$Date, format="%d/%m/%Y")
  dfr <- dfr[dfr$Date == as.Date("2007-02-01") | dfr$Date == as.Date("2007-02-02"),]
  dfr$Time <- strptime(paste(dfr$Date, dfr$Time), format="%Y-%m-%d %H:%M:%S")
  dfr$Date <- NULL
  dfr
}

data <- loaddata()

# Reset locale so the xlabels will be in English
Sys.setlocale("LC_TIME", "C")

png(filename="plot3.png")
plot(data$Time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright",
       lty = c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
dev.off()