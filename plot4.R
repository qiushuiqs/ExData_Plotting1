plot4<-function() {
  ##read and subset the data.frame
  rawdata<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", colClasses=c("character", "character", "numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))
  plotdata<-rawdata[rawdata$Date=="1/2/2007"|rawdata$Date=="2/2/2007",]
  xlab<-strptime(paste(plotdata$Date,plotdata$Time), "%d/%m/%Y %H:%M:%S")
  
  ##set 2 * 2 plots by going across row
  png(file="plot4.png")
  par(mfrow=c(2,2))
  ##plot 1
  plot(xlab, plotdata$Global_active_power, type="l",xlab="", ylab="Global Active Power(kilowatts)")
  ##plot 2
  plot(xlab, plotdata$Voltage, ylab="Voltage", xlab="datatime", type="l")
  ##plot 3
  plot(xlab, plotdata$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
  points(xlab, plotdata$Sub_metering_2, col="red", type="l")
  points(xlab, plotdata$Sub_metering_3, col="blue", type="l")
  legend("topright", lty=1, legend=c("Sub_metering1", "Sub_metering2", "Sub_metering3"), col=c("black","red","blue"), bty="n")
  ##plot 4
  plot(xlab, plotdata$Global_reactive_power, xlab="datatime", ylab="Global_reactive_power", type="l")
  ## Turn off device driver (to flush output to png)
  dev.off()
  ##set back to default numbers of plots per row
  par(mfrow=c(1,1))
}

plot4()