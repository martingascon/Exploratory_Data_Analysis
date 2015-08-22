# 2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# set working directory
setwd('~/Dropbox/Personal/Coursera/e_exploratory_data/On_git/Project2')

# list data files on data directory
list.files("./data/")

# load the data files
NEI <- readRDS("./data/summarySCC_PM25.rds")

# select the data
data2 <- subset (NEI, fips == "24510")
data2 <- tapply(data2$Emissions, data2$year, sum)

names(data2)<-as.integer(names(data2)) 
# create the file
png(filename="Plot2.png", width=480, height=480, units ="px")

# plot the data
plot(names(data2), data2, xlab = "Year", ylab="PM2.5 Total Emissions", main="PM2.5 Emission in Baltimore by Year")

# close the file
dev.off()

# Conclusion
# The PM2.5 total emission have decreased in Baltimore from 1999 to 2008
