## Function to make Global Active Power plot
makePlot2 <- function (file = "household_power_consumption.txt", 
                       start_date = as.Date("2007-02-01"),
                       end_date = as.Date("2007-02-02"), 
                       output_file = "figure\\plot2.png") {
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
    with(data, plot(Time, Global_active_power, col = "black", 
             type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

    ## Close the file
    dev.off()
}
