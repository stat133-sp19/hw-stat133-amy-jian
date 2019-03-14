# ---
# Title: Produce Shot Charts
# Description: This script will produce an image of a shot chart for each player and images containing all the shot charts.
# Input: 
#   * shots-data.csv
#   * nba-court.jpg
# Output: 
#   * andre-iguodala-shot-chart.pdf
#   * draymond-green-shot-chart.pdf
#   * kevin-durant-shot-chart.pdf
#   * klay-thompson-shot-chart.pdf
#   * stephen-curry-shot-chart.pdf
#   * gsw-shot-charts.pdf
#   * gsw-shot-charts.png
# ---

library(ggplot2)
library(jpeg)
library(grid)

# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

#read in shots data
shots <- read.csv("../data/shots-data.csv")
iguodala <- shots[shots$name == "Andre Iguodala", ]
green <- shots[shots$name == "Draymond Green", ]
durant <- shots[shots$name == "Kevin Durant", ]
thompson <- shots[shots$name == "Klay Thompson", ]
curry <- shots[shots$name == "Stephen Curry", ]

#make shot charts
pdf(file = "../images/andre-iguodala-shot-chart.pdf", height = 5, width = 6.5)
ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf", height = 5, width = 6.5)
ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf", height = 5, width = 6.5)
ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf", height = 5, width = 6.5)
ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf", height = 5, width = 6.5)
ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
dev.off()

#facetted shot chart
pdf(file = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
ggplot(data = shots) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + theme_minimal() + facet_wrap(~ name) + ggtitle("Shot Charts: GSW (2016 Season)")
dev.off()

png(filename = "../images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 1080)
ggplot(data = shots) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + theme_minimal() + facet_wrap(~ name) + ggtitle("Shot Charts: GSW (2016 Season)")
dev.off()
