# ---
# Title: Data Preparation for shots-data.csv
# Description: This script will:
# - add a name column to each player's data table
# - convert the values of shot_made_flag to the more descriptive values "shot_yes" and "shot_no"
# - add column minute containing the minute number when the shot occured
# - output a summary of each player's shot data
# - create a table containing all shot data
# - output a summary of all shot data
# Inputs: 
#   * andre-iguodala.csv
#   * draymond-green.csv
#   * kevin-durant.csv
#   * klay-thompson.csv
#   * stephen-curry.csv
# Outputs: 
#   * andre-iguodala-summary.txt
#   * draymond-green-summary.txt
#   * kevin-durant-summary.txt
#   * klay-thompson-summary.txt
#   * stephen-curry-summary.txt
#   * shots-data.csv
# ---

#reading in the player data
data_types <- c('factor', 'factor', 'factor', 'integer', 'integer', 'integer', 'character', 'factor', 'factor', 'integer', 'factor', 'integer', 'integer')

iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE, colClasses = data_types)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE, colClasses = data_types)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE, colClasses = data_types)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE, colClasses = data_types)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE, colClasses = data_types)

#adding name column
iguodala$name = c("Andre Iguodala")
green$name = c("Draymond Green")
durant$name = c("Kevin Durant")
thompson$name = c("Klay Thompson")
curry$name = c("Stephen Curry")

#change shot_made_flag to more descriptive values
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag <- as.factor(iguodala$shot_made_flag)

green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag <- as.factor(green$shot_made_flag)

durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag <- as.factor(durant$shot_made_flag)

thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag <- as.factor(thompson$shot_made_flag)

curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag <- as.factor(curry$shot_made_flag)

#add minute column
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
green$minute <- green$period * 12 - green$minutes_remaining
durant$minute <- durant$period * 12 - durant$minutes_remaining
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining
curry$minute <- curry$period * 12 - curry$minutes_remaining

#export summaries to text files
sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

#stack tables into one data frame
shots <- rbind(iguodala, green, durant, thompson, curry)

#export combined table as csv file
write.csv(shots, file = "../data/shots-data.csv")

#export shots summary to text file
sink(file = "../output/shots-data-summary.txt")
summary(shots)
sink()