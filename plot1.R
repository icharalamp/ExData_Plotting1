
#Load data
initial <-
  read.table(
    "household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    nrows = 5
  )


my_data <-
  read.table(
    "household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    skip = 66630,
    nrows = 2900,
    col.names = names(initial),
    na.strings = c("?"),
    colClasses = c(
      "character",
      "character",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric"
    )
  )



# Convert Date /Time
my_data$Date<-as.Date(my_data$Date, format = "%d/%m/%Y")
my_data$Time<-strptime(paste(my_data$Date,my_data$Time),"%F %T")


# Select the date
my_data<-subset(my_data,my_data$Date %in% as.Date(c("2007-02-01","2007-02-02")))



# Plot1 
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(my_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

png("plot1.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(my_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()






