setwd("C:/Adatok/coursera_edX/4_Exploratory Data analysis/Quizes_Assignments/Assignment1")

data<- read.table("household_power_consumption.txt", sep= ";", 
                  na.strings= "?", colClasses = c("character", "character", 
                                                  rep("numeric", 7)), header= TRUE)
d<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plot2
par(mar = c(4.2, 4.2, 1, 1))

library(lubridate)
d$Date2<- as.Date(d$Date, "%d/%m/%Y")
days<-weekdays(d$Date2)
d$sdays<- wday(d$Date2, label= TRUE)

DateTime<- paste(d$Date, d$Time)
d$DateTime<-strptime(DateTime, format= "%d/%m/%Y %H:%M:%S")
d$DateTime2<-as.POSIXct(d$DateTime)

with(d, plot(Global_active_power~d$DateTime2, type= "n", ylab= "Global Active Power (kilowatts)", 
             xlab= ""))
lines(d$Global_active_power~d$DateTime2)

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
