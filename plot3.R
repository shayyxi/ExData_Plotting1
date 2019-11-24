plot3<-function(filename)
{
	df<-read.csv2(filename,na.strings="?",colClasses="character")
	df2<-df
	df2$Date=as.Date(df2$Date,format="%d/%m/%Y")
	
	sub1<-subset(df2,Date>="2007-02-01" & Date<="2007-02-02")
	
	sub1$Sub_metering_1<-as.numeric(sub1$Sub_metering_1)
	sub1$Sub_metering_2<-as.numeric(sub1$Sub_metering_2)
	sub1$Sub_metering_3<-as.numeric(sub1$Sub_metering_3)
	dt<-paste(sub1$Date,sub1$Time)
	sub1$dt<-as.POSIXct(dt)
	png("plot3.png", width=480, height=480)
	plot(sub1$Sub_metering_1~sub1$dt,type="l",xlab="",ylab="Energy sub metering")
	lines(sub1$Sub_metering_2~sub1$dt,col="red")
	lines(sub1$Sub_metering_3~sub1$dt,col="blue")
	legend("topright",
			col=c("black","red","blue"),
			c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),
			lty=c(1,1),
			lwd=c(1,1))
	dev.off()

}