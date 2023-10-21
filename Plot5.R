## Setting Up
setwd("~/Desktop")

# Load ggplot2
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 5

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehiclesscc <- SCC[vehicles, ]$SCC
vehiclesnei <- NEI[NEI$SCC %in% vehiclesSCC, ]

baltimorenei <- subset(vehiclesnei, fips == "24510")

# Create the barplot using ggplot2
plot5 <- ggplot(baltimorenei, aes(x = factor(year), y = Emissions / 1e5)) +
  geom_bar(stat = "identity", fill = "grey", width = 0.75) +
  theme_bw() +
  guides(<scale> = "none") +
  labs(
    x = "Year",
    y = expression("Total PM"[2.5] * " Emission (10^5 Tons)"),
    title = expression("PM"[2.5] * " Motor Vehicle Source Emissions in Baltimore from 1999-2008")
  )
plot5

png("plot5.png")
dev.off()
