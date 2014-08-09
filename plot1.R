plot1<-function() {
  ##read and subset the data.frame
  rawdata<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", colClasses=c("character", "character", "numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))
  plotdata<-rawdata[rawdata$Date=="1/2/2007"|rawdata$Date=="2/2/2007",]
  ##set default numbers of plots per row
  par(mfrow=c(1,1))
  png(file="plot1.png")
  ##draw histgram
  hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
  ## Turn off device driver (to flush output to png)
  dev.off()
}

plot1()