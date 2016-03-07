plot4 <- function() {
    
    library(data.table)
    library(dplyr)
    library(lubridate)
    
    # read data and create a date-time column
    pow <- fread("household_power_consumption.txt",na.strings=c("?"))
    pow <- filter(pow,Date=="1/2/2007" | Date=="2/2/2007")
    pow <- mutate(pow, dt = dmy_hms(paste(Date,Time)))
    pow <- select(pow,-Date,-Time)
    pow <- arrange(pow,dt)
    
    png(file="plot4.png")

    # setup canvas
    par(mfrow=c(2,2))
        
    # 1st plot------
    with(pow, plot(dt,Global_active_power,xlab="",ylab="Global Active Power",
         type="l"))
    
    # 2nd plot------
    with(pow,plot(dt,Voltage,xlab="datetime",ylab="Voltage",type="l"))
    
    # 3rd plot
    with(pow,plot(dt,Sub_metering_1,type="l",xlab="",
                  ylab="Energy sub metering"))
    with(pow,lines(dt,Sub_metering_2,type="l",col="red"))
    with(pow,lines(dt,Sub_metering_3,type="l",col="blue"))
    legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_Metering_3"),
           lty=c(1,1,1),col=c("black","red","blue"),bty="n",cex=0.6)
    
    # 4th plot
    with(pow,plot(dt, Global_reactive_power, xlab="datetime", type="l"))
    
    dev.off()    
}