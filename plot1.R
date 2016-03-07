plot1 <- function() {
    
    library(data.table)
    library(dplyr)
    library(lubridate)
    
    # read data and filter the dates we're interested in
    pow <- fread("household_power_consumption.txt",na.strings=c("?"))
    pow <- filter(pow,Date=="1/2/2007" | Date=="2/2/2007")
    
    # open the png device
    png(file="plot1.png")
    
    # do the plot
    hist(pow$Global_active_power,col="red",main="Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
    
    dev.off()    
}
