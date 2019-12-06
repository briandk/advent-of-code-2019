# to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.
library(magrittr)
library(readr)

raw_masses <- readr::read_csv("puzzle-input.csv")

compute_fuel <- function(mass) {
  computed_fuel <- (mass / 3) %>%
    floor()
  return(computed_fuel - 2)
}

computed_fuel <- sapply(raw_masses, compute_fuel)
total_fuel_needed <- sum(computed_fuel)
print(total_fuel_needed)
