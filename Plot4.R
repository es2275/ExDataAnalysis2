## Setting Up
setwd("~/Desktop")

# Load ggplot2
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 4

combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)
coalandcomb <- (combustionRelated & coalRelated)
scccoalcomb <- SCC[coalCombustion, ]$SCC
neicoalcomb <- NEI[NEI$SCC %in% combustionSCC, ]


toalcoalcomb <- aggregate(Emissions ~ year, neicoalcomb, sum)


plot4<-barplot(toalcoalcomb$Emissions / 1e5,
               names.arg = toalcoalcomb$year,
               xlab = "Year",
               ylab = "PM2.5 Emission (10^5 Tons)",
               main = "PM2.5 Coal Combustion Source Emissions Across US",
               col = "grey")
plot4

png("plot4.png")
dev.off()
