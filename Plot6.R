## Setting Up
setwd("~/Desktop")

# Load ggplot2
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 6

vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehiclesscc <- SCC[vehicles, ]$SCC
vehiclesnei <- NEI[NEI$SCC %in% vehiclesscc, ]

vehiclesnei$city <- ifelse(vehiclesnei$fips == "24510", "Baltimore City", "Los Angeles County")

plot6 <- ggplot(vehiclesnei, aes(x = factor(year), y = Emissions / 1000, fill = city)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ city, scales = "free") +
  labs(
    x = "Year",
    y = expression("Total PM"[2.5] * " Emission (Kilo-Tons)"),
    title = expression("PM"[2.5] * " Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")
  ) +
  theme_minimal()

plot6

png("plot6.png")
dev.off()
