plot2<-function() {
  ##read and subset the data.frame
  rawdata<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", colClasses=c("character", "character", "numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))
  plotdata<-rawdata[rawdata$Date=="1/2/2007"|rawdata$Date=="2/2/2007",]
  xlab<-strptime(paste(plotdata$Date,plotdata$Time), "%d/%m/%Y %H:%M:%S")
  ##set default numbers of plots per row
  par(mfrow=c(1,1))
  png(file="plot2.png")
  ##draw the line chart
  plot(xlab, plotdata$Global_active_power, type="l",xlab="", ylab="Global Active Power(kilowatts)")
  ## Turn off device driver (to flush output to png)
  dev.off()
}

plot2()