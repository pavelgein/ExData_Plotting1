## Function to make Global Active Power plot
makePlot1 <- function (file = "household_power_consumption.txt", 
                       start_date = as.Date("2007-02-01"),
                       end_date = as.Date("2007-02-02"), 
                       output_file = "figure\\plot1.png") {
    ## Read a date from a file
    data <- read.csv(file, sep = ";", 
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric"), 
                     na.string = "?")

    ## Coerce a date column to Date format
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    ## Filter data
    data <- data[data$Date >= start_date & data$Date <= end_date, ]
    ## Open a output file
    png(output_file, width = 480, height = 480)
    ## Make a plot
    par(bg = "transparent")
    hist(data$Global_active_power, col = "red", 
         xlab = "Global Active Power (kilowatts)", 
         main = "Global Active Power")

    ## Close the file
    dev.off()
}
