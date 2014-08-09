## there are faster / better ways to load the data - but this will do for now

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


##setup histogram 

png(filename="plot2.png", width=480, height=480)

plot(target_dates$target_datetime, target_dates$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)",xlab="")

dev.off()

