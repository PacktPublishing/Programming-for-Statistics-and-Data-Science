
# recreate the yugioh vector if you don't have it ready

cards <- c("Blue-Eyes White Dragon", "Exodius", "The Winged Dragon of Ra", "Raigeki", 
           "Slifer the Sky Dragon", "Obelisk the Tormentor", "Black Luster Soldier", 
           "5-Headed Dragon", "Exodia the Forbidden One", "Dragon Master Knight")
atk <- c(3000, NA, NA, NA, NA, 4000, 3000, 5000, 1000, 5000)
yugioh <- c(cards, atk)

# create the monster vector and combine it with the yugioh object

monster <- c(T, T, T, F, T, T, T, T, T, T)
yugioh <- c(yugioh, monster)
typeof(yugioh)
print(yugioh) 

# every value is printed in quotes which means everything has been converted into a character string

coerce.check <- c(atk, monster)
coerce.check

# T, T, T, F, T, T, T, T, T, T has become
# 1, 1, 1, 0, 1, 1, 1, 1, 1, 1 

setwd("C:/Users/Simona Dobreva/Documents/UDEMY/R COURSE/Data")
