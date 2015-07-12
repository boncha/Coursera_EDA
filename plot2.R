## Code for constructing histogram of "Global Active Power" from "household_power_consumption.txt" dataset
## I have already determined that the data of interest (i.e, dates 2007-02-01 and 2007-02-02) are contained between
## rows 66638 and  69517, that is why when we read the data we skip the first 66637 rows and we read the following 2880 rows.
##
## In order to have the x-axis show the weekdays I ran:
## weekdays(as.Date("1/2/2007", format="%d/%m/%Y"))
## [1] "Thursday"
## weekdays(as.Date("2/2/2007", format="%d/%m/%Y"))
## [1] "Friday"
## so we know that the days in question were a Thursday and Friday
## Then I looked at which rows of the data set encompassed each day with:
## min(which(my_data[,1]=="1/2/2007"))
## [1] 1
## min(which(my_data[,1]=="2/2/2007"))
## [1] 1441
## max(which(my_data[,1]=="2/2/2007"))
## [1] 2880
## 
## Based on this, I created the plot with plot(...), setting xaxt="n" so no values would be shown on the x-axis.
## And then I added the weekdays to the corresponding x-axis locations.

my_data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings = "?",skip=66637, nrows=2880)
my_headers<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",nrows=1,stringsAsFactors = FALSE)

colnames(my_data)<-unlist(my_headers)

plot(my_data$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")

axis(side=1,labels=c("Thu","Fri","Sat"), at=c(1,1440,2881))

dev.copy( png, file="plot2.png")
dev.off()
