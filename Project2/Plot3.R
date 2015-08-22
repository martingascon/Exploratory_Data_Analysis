# 3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
library(plyr)
library(ggplot2)

# set working directory
setwd('~/Dropbox/Personal/Coursera/e_exploratory_data/On_git/Project2')

# list data files on data directory
list.files("./data/")

# load the data files
NEI <- readRDS("./data/summarySCC_PM25.rds")

# select the data
data3 <- subset (NEI, fips == "24510")
data3 <- ddply(data3, .(year, type), summarize, Emissions = sum(Emissions))
data3$Pollutant_Type <- data3$type

# create the file
png(filename="Plot3.png", width=480, height=480, units ="px")

# plot the data
qplot(year, Emissions, data=data3, color=type, geom ="line", 
      xlab = "Year", ylab="PM2.5 Total Emissions",
      main ="Emmission by type of Pollutant in Baltimore") 

# close the file
dev.off()

# Conclusion
# The PM2.5 total emission have decreased in Baltimore for all sources from 1999 to 2008
# Point had spiked in 2005 and it is responsible for the increase in Plot 2.

