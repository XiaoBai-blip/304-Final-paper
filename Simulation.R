# Load all packages that may need in this simulation
library(knitr)
library(janitor)
library(lubridate)
library(tidyverse)
library(tidyr)
# To simulate our data, we need to create a dataset with nine columns: 
# ‘by residence’, ‘year’, 'no_education', 'primary_incomplete', and etc. 
# that are listed below. In the case of 'by_residence', reasonable values could 
# be 'Mainland', "total_urban' and six more.

set.seed(789)# We randomly set values for set seed

simulated_fire_data <- 
  tibble(
    Method_of_fire_control  = 
      c(                 # Randomly choose one of eight options, we repeat the name of each residence 20 times with rep()
        rep('Action taken unclassfied', 20),
        rep('Fire self extinguished',20 ),
        rep('Extinguished by occupant', 20),
        rep('Extinguished by automatic system', 20),
        rep('Extinguished by fire department', 120)),
    Building_status  = 
      c(                 # Randomly choose one of eight options, we repeat the name of each residence 20 times with rep()
        rep('Undetermined', 40),
        rep('Not applicable', 20),
        rep('Abandoned', 20),
        rep('Under demolition', 60),
        rep('Under construction', 20),
        rep('Under Renovation',20),
        rep('Normal',20)),
    Sprinkler_system_operation  = 
      c(                 # Randomly choose one of eight options, we repeat the name of each residence 20 times with rep()
        rep('Activation/Operation undetermined', 30),
        rep('Not applicable - no sprinkler system present', 70),
        rep('Did not activate', 20),
        rep('Other reason for non activation', 20),
        rep('Did not activate: fire too small to trigger system', 20),
        rep('Did not activate: remote from fire',20),
        rep('Sprinkler system activated',20)),
    Fire_Alarm_System_Operation  = 
      c(                 # Randomly choose one of eight options, we repeat the name of each residence 20 times with rep()
        rep('Undetermined', 40),
        rep('Not applicable', 70),
        rep('Fire alarm system did not operate', 50),
        rep('Fire alarm system operate', 40)),
    Number_of_responding_apparatus = 
      runif(n = 200,    # we draw from the uniform distribution with runif() to simulate an estimated value with size 200
            min = 1, # set the minimum and maximum values, and 
            max = 175), # these values are from observing our raw data. The purpose is to let R generate similar values as raw dataset 
    Number_of_responding_personnel = 
      runif(n = 200,    # repeat the similar process as above but this time generate another variable.
            min = 1, 
            max = 537),
    
    Estimated_Dollar_Loss = # repeat the same process
      runif(n = 200,
            min = 0, 
            max = 50000000),
    Arrival_Time = # repeat the same process
      runif(n = 200,
            min = 24, 
            max = 17871)
  )