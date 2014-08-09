plot3<-function() {
  ##read and subset the data.frame
  rawdata<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", colClasses=c("character", "character", "numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))
  plotdata<-rawdata[rawdata$Date=="1/2/2007"|rawdata$Date=="2/2/2007",]
  xlab<-strptime(paste(plotdata$Date,plotdata$Time), "%d/%m/%Y %H:%M:%S")
  ##set default numbers of plots per row
  par(mfrow=c(1,1))
  png(file="plot3.png")
  ##Graph the x,y axis and plot the data subsequently
  plot(xlab, plotdata$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
  points(xlab, plotdata$Sub_metering_2, col="red", type="l")
  points(xlab, plotdata$Sub_metering_3, col="blue", type="l")
  legend("topright", lty=1, legend=c("Sub_metering1", "Sub_metering2", "Sub_metering3"), col=c("black","red","blue"))
  ## Turn off device driver (to flush output to png)
  dev.off()
}

plot3()