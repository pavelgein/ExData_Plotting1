makePlot4 <- function (file = "household_power_consumption.txt", 
                       start_date = as.Date("2007-02-01"),
                       end_date = as.Date("2007-02-02"), 
                       output_file = "figure\\plot4.png") {
    ## Read a date from a file
    data <- read.csv(file, sep = ";", 
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric"), 
                     na.string = "?")

    ## Coerce a time column to time format
    data$Time <- strptime(paste(data$Date, data$Time), 
                             format = "%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    ## Filter data
    data <- data[data$Date >= start_date & data$Date <= end_date, ]
    ## Change a locale for date
    Sys.setlocale("LC_TIME", "C")
    ## Open a output file
    png(output_file, width = 480, height = 480)
    ## Make a plot
    par(bg = "transparent")
    par(mfrow = c(2, 2))
    ## Plot 1
    with(data, plot(Time, Global_active_power, col = "black", 
                    type = "l", xlab = "", ylab = "Global Active Power"))
    ## Plot 2
    with(data, plot(Time, Voltage, col = "black", 
                    type = "l", ylab = "Voltage", xlab = "datetime"))
    ## Plot 3
    with(data, plot(Time, Sub_metering_1, col = "black", 
                    type = "l", xlab = "", ylab = "Energy sub metering"))
    with(data, points(Time, Sub_metering_2, col = "red", 
                    type = "l", xlab = ""))
    with(data, points(Time, Sub_metering_3, col = "blue", 
                    type = "l", xlab = ""))
    legend("topright", lty = 1, 
           col = c("black", "red", "blue"), bty = "n",  
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    ## Plot 4
    with(data, plot(Time, Global_reactive_power, col = "black", 
                    type = "l", xlab = "datetime"))

    ## Close the file
    dev.off()
}


