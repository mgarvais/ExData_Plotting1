## plot3.r   energy sub metering

# load up the file
power<-read.table("household_power_consumption.txt", header=TRUE,sep=";")


## Our target dates are 2007-02-01 and 2007-02-02
## dates begin at 21998  last row is 24877

target_dates <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')

#change date format  - add date time
target_dates$Date<-(as.Date(target_dates$Date,format="%d/%m/%Y"))
target_dates$target_datetime<-as.POSIXct(paste(target_dates$Date, target_dates$Time))

        
#set as numeric
#target_dates$Global_active_power<-as.numeric(as.character(target_dates$Global_active_power))
target_dates$Sub_metering_1r<-as.numeric(as.character(target_dates$Sub_metering_1))
target_dates$Sub_metering_2<-as.numeric(as.character(target_dates$Sub_metering_2))
target_dates$Sub_metering_3<-as.numeric(as.character(target_dates$Sub_metering_3))

##setup histogram 

png(filename="plot3.png", width=480, height=480)

plot(target_dates$target_datetime, target_dates$Sub_metering_1, type="l", ylab="Energy sub meetering",xlab="", col="black")

lines(target_dates$target_datetime, target_dates$Sub_metering_2, col="red")
lines(target_dates$target_datetime, target_dates$Sub_metering_3, col="blue")

#set legend
legend("topright",
      c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
      lty=c(1,1),
      lwd=c(1.5,1.5),
      col=c("black","red", "blue"))

dev.off()

