# 5) How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# set working directory
setwd('~/Dropbox/Personal/Coursera/e_exploratory_data/On_git/Project2')

# list data files on data directory
list.files("./data/")

# load the data files
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# select the data
SCC_cars <- SCC[grep("Vehicles", SCC$Short.Name, ignore.case = TRUE), ]
data5 <- NEI[NEI$SCC %in% SCC_cars$SCC,]
data5 <- subset (data5, fips == "24510")
data5 <- tapply(data5$Emissions, data5$year, sum)

# create the file
png(filename="Plot5.png", width=480, height=480, units ="px")

# plot the data
plot(names(data5), data5, xlab = "Year", ylab="PM2.5, Total Emissions", 
     main="PM2.5 Emission from motor vehicles in Baltimore")
 
# close the file
dev.off()

# Conclusion
# The PM2.5 total emission from motor vehicles in Baltimore have decrease from 1999 to 2008.


