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

png(filename="plot2.png")
plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()