## plot4.r  

# load up the file
power<-read.table("household_power_consumption.txt", header=TRUE,sep=";")


## Our target dates are 2007-02-01 and 2007-02-02
## dates begin at 21998  last row is 24877

target_dates <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')

#change date format  - add date time
target_dates$Date<-(as.Date(target_dates$Date,format="%d/%m/%Y"))
target_dates$target_datetime<-as.POSIXct(paste(target_dates$Date, target_dates$Time))

        
#set as numeric
target_dates$Global_active_power<-as.numeric(as.character(target_dates$Global_active_power))
target_dates$Global_reactive_power<-as.numeric(as.character(target_dates$Global_reactive_power))
target_dates$Sub_metering_1r<-as.numeric(as.character(target_dates$Sub_metering_1))
target_dates$Sub_metering_2<-as.numeric(as.character(target_dates$Sub_metering_2))
target_dates$Sub_metering_3<-as.numeric(as.character(target_dates$Sub_metering_3))
target_dates$voltage<-as.numeric(as.character(target_dates$voltage))

##setup parameters

png(filename="plot4.png", width=480, height=480)
par(mfcol = c(2, 2) 

## from plot1.R

plot(target_dates$target_datetime, target_dates$Global_active_power, type="l", ylab="Global Active Power",xlab="")

## from plot2.R
plot(target_dates$target_datetime, target_dates$Voltage, type="l", ylab="Voltage",xlab="")
  
    
## from #3    
 plot(target_dates$target_datetime, target_dates$Sub_metering_1, type="l", ylab="Energy sub meetering",xlab="", col="black")
 lines(target_dates$target_datetime, target_dates$Sub_metering_2, col="red")
 lines(target_dates$target_datetime, target_dates$Sub_metering_3, col="blue")

 #set legend
 legend("topright",
      c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
      lty=c(1,1),
      lwd=c(1.5,1.5),
      col=c("black","red", "blue"))



## 4 goes here


plot(target_dates$target_datetime, target_dates$Global_reactive_power, type="l", ylab="Global_reactive_Power",xlab="")



dev.off()

