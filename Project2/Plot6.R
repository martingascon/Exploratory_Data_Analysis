# 6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

library(graphics)
# set working directory
setwd('~/Dropbox/Personal/Coursera/e_exploratory_data/On_git/Project2')

# list data files on data directory
list.files("./data/")

# load the data files
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# select the data
SCC_cars <- SCC[grep("Vehicles", SCC$Short.Name, ignore.case = TRUE), ]
data6 <- NEI[NEI$SCC %in% SCC_cars$SCC,]

data6_LA <-subset (data6, fips == "06037")
data6_BA <- subset (data6, fips == "24510")

data6_LA <- tapply(data6_LA$Emissions, data6_LA$year, sum)
data6_BA <- tapply(data6_BA$Emissions, data6_BA$year, sum)

# put the data in cols
data6 <- cbind(data6_LA, data6_BA)
colnames(data6) <- c("Los Angeles", "Baltimore")

# print the data
data6

# create the file
png(filename="Plot6.png", width=480, height=480, units ="px")

# plot the data
matplot(rownames(data6),data6, type = "p", pch=1, lwd=2, col = c("red","blue"), 
        xlab = "years", ylab = "PM2.5 Total Emissions", main="PM2.5, Vehicle emissions ")  
legend("center", legend = colnames(data6), col=c("red","blue"), pch=1)  
 
# close the file
dev.off()

# Conclusion
# Los Angeles county has seen greater changes over time



