# 1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

# set working directory
setwd('~/Dropbox/Personal/Coursera/e_exploratory_data/On_git/Project2')
#unzip the file
unzip("./data/exdata_data_NEI_data.zip", exdir="./data/")

#list data files on data directory
list.files("./data/")

# load the data files
NEI <- readRDS("./data/summarySCC_PM25.rds")
 
# select the data
data <- tapply(NEI$Emissions, NEI$year, sum)
names(data)<-as.integer(names(data)) 

#create the file
png(filename="Plot1.png", width=480, height=480, units ="px")

#plot the data
plot(names(data),data, xlab = "Year", ylab="PM2.5 Total Emissions", main="PM2.5 Emission in U.S. by Year")

#close the file
dev.off()

# Conclusion
# The PM2.5 total emission have decreased in the U.S. from 1999 to 2008
