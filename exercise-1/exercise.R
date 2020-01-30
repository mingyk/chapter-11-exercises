# Exercise 1: working with data frames (review)

# Install devtools package: allows installations from GitHub
install.packages("devtools")

# Install "fueleconomy" dataset from GitHub
devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)

# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
make <- vehicles[["make"]]

# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
unique(make, incomparables = FALSE)

# Filter the data set for vehicles manufactured in 1997
filter97 <- vehicles[vehicles["year"] == 1997, ] 

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
filter97[order(filter97$hwy), ]

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
filter97["average"] <- (filter97["hwy"] + filter97["cty"]) / 2

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
more_than_twenty <- vehicles[vehicles["drive"] == "2-Wheel Drive" & vehicles["hwy"] > 20, ]

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
more_than_twenty[min(more_than_twenty["hwy"]), 1] #27557

# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!
function_1 <- function(year_choice, make_choice){
  filter95 <- vehicles[vehicles["make"] == "Honda" & vehicles["year"] == 1995, ]
  return <- filter95[max(filter95["hwy"]), 2]
  return(return)
}

# What was the most efficient Honda model of 1995?
function_1(1995, "Honda")
