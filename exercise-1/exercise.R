### Exercise 1: Data Frame Practice

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame

#install.packages("fueleconomy")
library(fueleconomy)
head(vehicles)
# Create a data.frame of vehicles from 1997 only
vehicles97 <- vehicles[grep("1997", vehicles$year), ]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame

unique(vehicles97$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city

two_wheel_drive <- vehicles[grep("2-Wheel Drive", vehicles$drive), ]
fuel_efficient <- two_wheel_drive[two_wheel_drive$cty > 20, ]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?

best <- fuel_efficient[which.min(fuel_efficient$hwy), 1]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year

fun <- function(year, make) {
  temp1 <- vehicles[grep(year, vehicles$year), ]
  temp2 <- temp1[grep(make, temp1$make), ]
  result <- temp2[which.max(temp2$hwy), 3]
  return(result)
}

# What was the most efficient honda model of 1995?

top <- fun("1995", "Honda")

