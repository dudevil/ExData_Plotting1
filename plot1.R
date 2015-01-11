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

png(filename="plot1.png")
hist(data$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()


