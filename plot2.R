plot2<-function(filename)
{
	df<-read.csv2(filename,na.strings="?",colClasses="character")
	df2<-df
	df2$Date=as.Date(df2$Date,format="%d/%m/%Y")
	
	sub1<-subset(df2,Date>="2007-02-01" & Date<="2007-02-02")
	
	sub1$Global_active_power<-as.numeric(sub1$Global_active_power)
	dt<-paste(sub1$Date,sub1$Time)
	sub1$dt<-as.POSIXct(dt)
	png("plot2.png", width=480, height=480)
	plot(sub1$Global_active_power~sub1$dt,type="l",xlab="",ylab="Global Active Power (kilowatts)")
	dev.off()

}