setwd("C:/Adatok/coursera_edX/4_Exploratory Data analysis/Quizes_Assignments/Assignment1")

data<- read.table("household_power_consumption.txt", sep= ";", 
                  na.strings= "?", colClasses = c("character", "character", 
                  rep("numeric", 7)), header= TRUE)
d<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plot1
par(mar = c(4.2, 4.2, 1, 1))
hist(d$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", 
     ylab= "Frequency", main= "Global Active Power", breaks= 20)

dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()