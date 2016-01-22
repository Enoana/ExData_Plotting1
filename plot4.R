setwd("C:/Adatok/coursera_edX/4_Exploratory Data analysis/Quizes_Assignments/Assignment1")

data<- read.table("household_power_consumption.txt", sep= ";", 
                  na.strings= "?", colClasses = c("character", "character", 
                                                  rep("numeric", 7)), header= TRUE)
d<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

library(lubridate)
d$Date2<- as.Date(d$Date, "%d/%m/%Y")
days<-weekdays(d$Date2)
d$sdays<- wday(d$Date2, label= TRUE)

DateTime<- paste(d$Date, d$Time)
d$DateTime<-strptime(DateTime, format= "%d/%m/%Y %H:%M:%S")
d$DateTime2<-as.POSIXct(d$DateTime)

#Plot4

png("plot4.png", width= 480, height= 480)
par(mfrow= c(2,2), mar = c(4.2, 4.2, 1, 1))

with(d, plot(Global_active_power~d$DateTime2, type= "n", ylab= "Global Active Power (kilowatts)", 
             xlab= "")) 
lines(d$Global_active_power~d$DateTime2)

with(d, plot(Voltage ~ d$DateTime2, type= "n", ylab= "Voltage", xlab= "datetime"))
lines(d$Voltage~d$DateTime2)

with(d, plot(Sub_metering_1 ~ d$DateTime2, type= "n", ylab= "Energy sub metering", xlab= ""), 
     plot(Sub_metering_2~d$DateTime2, type= "n"), plot(Sub_metering_3~d$DateTime2, type= "n"))
lines(d$Sub_metering_1~d$DateTime2, lty= 1)
lines(d$Sub_metering_2~d$DateTime2, lty=1, col= "red")
lines(d$Sub_metering_3~d$DateTime2, lty=1, col= "blue")
legend("topright", bty= "n", lty= c(1,1,1), col= c("black", "red", "blue"), 
       cex=1 ,legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(d, plot(Global_reactive_power ~ d$DateTime2, type= "n", ylab= "Global_reactive_power", 
             xlab= "datetime"))
lines(d$Global_reactive_power~d$DateTime2)

dev.off()
