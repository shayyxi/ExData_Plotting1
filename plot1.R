plot1<-function(filename)
{
	df<-read.csv2(filename,na.strings="?",colClasses="character")
	df2<-df
	df2$Date=as.Date(df2$Date,format="%d/%m/%Y")
	
	sub1<-subset(df2,Date>="2007-02-01" & Date<="2007-02-02")
	
	sub1$Global_active_power<-as.numeric(sub1$Global_active_power)
	png("plot1.png", width=480, height=480)
	hist(sub1$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
	dev.off()

}