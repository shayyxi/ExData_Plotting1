plot4<-function(filename)
{
	df<-read.csv2(filename,na.strings="?",colClasses="character")
	df2<-df
	df2$Date=as.Date(df2$Date,format="%d/%m/%Y")
	
	sub1<-subset(df2,Date>="2007-02-01" & Date<="2007-02-02")
	
	sub1$Global_active_power<-as.numeric(sub1$Global_active_power)
	sub1$Voltage<-as.numeric(sub1$Voltage)
	sub1$Global_reactive_power<-as.numeric(sub1$Global_reactive_power)
	sub1$Sub_metering_1<-as.numeric(sub1$Sub_metering_1)
	sub1$Sub_metering_2<-as.numeric(sub1$Sub_metering_2)
	sub1$Sub_metering_3<-as.numeric(sub1$Sub_metering_3)
	dt<-paste(sub1$Date,sub1$Time)
	sub1$dt<-as.POSIXct(dt)
	png("plot4.png", width=480, height=480)
	par(mfrow=c(2,2))
	plot(sub1$Global_active_power~sub1$dt,type="l",xlab="",ylab="Global Active Power (kilowatts)")
	plot(sub1$Voltage~sub1$dt,type="l",xlab="datetime",ylab="Voltage")
	plot(sub1$Sub_metering_1~sub1$dt,type="l",xlab="",ylab="Energy sub metering")
	lines(sub1$Sub_metering_2~sub1$dt,col="red")
	lines(sub1$Sub_metering_3~sub1$dt,col="blue")
	legend("topright",
			col=c("black","red","blue"),
			c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),
			lty=c(1,1),
			lwd=c(1,1))
			
	plot(sub1$Global_reactive_power~sub1$dt,type="l",xlab="datetime",ylab="Global_reactive_power")
	dev.off()

}