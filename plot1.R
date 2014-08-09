## there are faster / better ways to load the data - but this will do for now

# load up the file
power<-read.table("household_power_consumption.txt", header=TRUE,sep=";")


## Our target dates are 2007-02-01 and 2007-02-02
## dates begin at 21998  last row is 24877

target_dates <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')


#set as numeric
target_dates$Global_active_power<-as.numeric(as.character(target_dates$Global_active_power))


##setup histogram 

png(filename='plot1.png', width=480, height=480)

hist(as.numeric(target_dates$Global_active_power), xlab='Global Active Power (Kilowatts)', main='Global Active Power', col='red')

dev.off()

