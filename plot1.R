## Code for constructing histogram of "Global Active Power" from "household_power_consumption.txt" dataset
## I have already determined that the data of interest (i.e, dates 2007-02-01 and 2007-02-02) are contained between
## rows 66638 and  69517, that is why when we read the data we skip the first 66637 rows and we read the following 2880 rows.

my_data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings = "?",skip=66637, nrows=2880)
my_headers<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",nrows=1,stringsAsFactors = FALSE)

colnames(my_data)<-unlist(my_headers)

hist(my_data$Global_active_power, col="red",main= "Global Active Power", xlab = "Global Active Power (kilowatts)")


dev.copy( png, file="plot1.png")
dev.off()

