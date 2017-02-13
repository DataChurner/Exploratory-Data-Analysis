# Subsetting before Load
# The code executes a shell script which greps the original file for the dates
# under consideration (1/2/2007 and 2/2/2007) using regular expressions
# this creates a txt file firsecfeb under documents.

system("cmd.exe", input = "C:\\Users\\Tatha\\Documents\\subset.sh")

# Load a dataframe with the subsetted information from first and second feb
febdata <- read.table("firsecfeb.txt",na.strings = "?",sep = ";")

# obtain the header from the first row of the raw data
# the transpose of rows, gives a listing of columns
vars <- read.table("household_power_consumption.txt", nrow=1,na.strings = "?",sep = ";")
names(febdata) <- t(vars[1,])

# format the date and time variables into one column 

fmtfebdata <- within(febdata, {Date_time = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S")})

#xyplot of sub metering values for the two days
png(file = "plot3.png",width = 480, height = 480, bg = "white")
plot(fmtfebdata$Date_time,fmtfebdata$Sub_metering_1,type = "l", main = "", xlab = "", ylab = "Energy sub metering")
lines(fmtfebdata$Date_time,fmtfebdata$Sub_metering_2,col = "red")
lines(fmtfebdata$Date_time,fmtfebdata$Sub_metering_3,col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lwd=1, lty=c(1,1,1), pch=c(NA,NA,NA))
dev.off()
