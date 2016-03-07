plot3 <- function() {
    
    library(data.table)
    library(dplyr)
    library(lubridate)
    
    # read data and filter dates
    pow <- fread("household_power_consumption.txt",na.strings=c("?"))
    pow <- filter(pow,Date=="1/2/2007" | Date=="2/2/2007")
    
    # create a date-time variable and select the columns we need
    pow <- mutate(pow, dt = dmy_hms(paste(Date,Time)))
    pow <- select(pow,dt,Sub_metering_1,Sub_metering_2,Sub_metering_3)
    pow <- arrange(pow,dt)
    
    # open the png device and do the plots
    png(file="plot3.png")
    
    with(pow,plot(dt,Sub_metering_1,type="l",xlab="",
                  ylab="Energy sub metering"))
    with(pow,lines(dt,Sub_metering_2,type="l",col="red"))
    with(pow,lines(dt,Sub_metering_3,type="l",col="blue"))
    
    # create a legend
    legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_Metering_3"),
           lty=c(1,1,1),col=c("black","red","blue"))
    
    dev.off()    
}