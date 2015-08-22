# 4) Across the United States, how have emissions from coal combustion-related sources changed 
# from 1999–2008?

# set working directory
setwd('~/Dropbox/Personal/Coursera/e_exploratory_data/On_git/Project2')

# list data files on data directory
list.files("./data/")

# load the data files
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# select the data
SCC_coal <- SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE), ]
data4 <- NEI[NEI$SCC %in% SCC_coal$SCC,]
data4 <- tapply(data4$Emissions, data4$year, sum)

# create the file
png(filename="Plot4.png", width=480, height=480, units ="px")

# plot the data
plot(names(data4), data4, xlab = "Year", ylab="PM2.5, Total Emissions", main="PM2.5 Emission from Coal in U.S.")


# close the file
dev.off()

# Conclusion
# The PM2.5 total emission from Coal in the US have decreased significanlty from 2005 to 2008,
# but not so much from 1999 to 2005


