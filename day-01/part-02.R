# to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.
library(magrittr)
library(purrr)
library(readr)

raw_masses <- readr::read_csv("puzzle-input.csv")

compute_fuel <- function(mass) {
  mass_of_computed_fuel <- (mass / 3) %>%
    floor() %>%
    `-`(2)
  if (mass_of_computed_fuel <= 0) {
    return (0)
  } else {
    return(mass_of_computed_fuel + compute_fuel(mass_of_computed_fuel))
  }
}

sapply(raw_masses$mass, compute_fuel) %>%
  sum() %>%
  print()

# computed_fuel <- NULL

# for (mass in raw_masses$mass) {
#   print(mass)
#   computed_fuel <- c(computed_fuel, compute_fuel(mass))
# }


# compute_fuel(14) %>% print()
# compute_fuel(1969) %>% print()
# compute_fuel(100756) %>% print()
