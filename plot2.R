## Nrows = 2,075,259
## Ncols = 9 (10 char, 8 char, num, num, num, num, num, num, num)
## Nrows x (10Bytes + 8Bytes + 7x8Bytes) 
##   = Nrows x 74Bytes 
##   = 153.569.166Bytes
##   = 153.569.166/2^20 = 146.4549694 MB
##   = 146.5 MB


ini <- read.table("household_power_consumption.txt", sep =";", header=TRUE)
ini[,"Date"] <- as.Date(ini[,"Date"],"%d/%m/%Y")

yr1 = as.Date("2007-02-01")
yr2 = as.Date("2007-02-02")
sub.df = subset(ini, Date >=yr1 & Date <=yr2)
sub.df[,"Global_active_power"] <- as.numeric(sub.df[,"Global_active_power"])
sub.df$day <- weekdays(as.Date(sub.df$Date))

plot(sub.df$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="", xaxt='n')
axis(1, at=1:3,labels=c("Thu","Fri","Sat"))

dev.copy(png,file="plot2.png")
dev.off()