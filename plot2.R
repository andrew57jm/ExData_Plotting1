plot2 <- function() {
    
    library(data.table)
    library(dplyr)
    library(lubridate)
    
    # read and filter the data we're interested in
    pow <- fread("household_power_consumption.txt",na.strings=c("?"))
    pow <- filter(pow,Date=="1/2/2007" | Date=="2/2/2007")
    
    # create a date-time variable
    pow <- mutate(pow, dt = dmy_hms(paste(Date,Time)))
    pow <- select(pow,dt,Global_active_power)
    
    # open the device and plot
    png(file="plot2.png")
    
    with(pow,plot(dt,Global_active_power,type="l",xlab="",
                  ylab="Global Active Power (kilowatts)"))
    
    dev.off()    
}