#### Preamble ####
# Purpose: Clean the survey data downloaded from Open data Toronto
# Author: Xiao Bai
# Data: 27 April 2021
# Contact: x.bai@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
# Use R Projects, not setwd().
library(tidyverse)
#install.packages("Rmisc")
library(car)
library(ggplot2)
library(Rmisc)
#install.packages("gridExtra")
library(gridExtra)
library(grid)
# read the data
fire = read_csv('Fire Incidents.csv', show_col_types = FALSE)
# Just keep some variables that may be of interest
blood_pressure2 = fire %>% #select predictors that will be used in this research and do the cleaning process
  select(Estimated_Dollar_Loss, Number_of_responding_apparatus, Number_of_responding_personnel, Method_Of_Fire_Control,Sprinkler_System_Operation, TFS_Alarm_Time, TFS_Arrival_Time, Building_Status,Fire_Alarm_System_Operation )%>%
  filter(!is.na(Estimated_Dollar_Loss),!is.na(Number_of_responding_apparatus), !is.na(Number_of_responding_personnel),!is.na(Sprinkler_System_Operation), !is.na(TFS_Alarm_Time),!is.na(TFS_Arrival_Time), !is.na(Building_Status), !is.na(Fire_Alarm_System_Operation))%>%
  mutate(Estimated_Dollar_Loss = Estimated_Dollar_Loss/10000, time_diff = difftime(TFS_Arrival_Time, TFS_Alarm_Time), arrival = as.numeric(time_diff))


# save the final cleaned variable into a new data frame
blood_pressure = blood_pressure2%>%
  select(Estimated_Dollar_Loss, Number_of_responding_apparatus, Number_of_responding_personnel,arrival, Method_Of_Fire_Control,Sprinkler_System_Operation,Building_Status,Fire_Alarm_System_Operation)
         

## Create training and test set 
set.seed(000)

# Count the number of observations in the data
n <- nrow(blood_pressure)

# Randomly choose 80% as training
training_indices <- sample(1:n, size=round(0.8*n))

# Add a column called "rowid" to our original data
blood_pressure <- blood_pressure %>% rowid_to_column()

# Create a training set
train <- blood_pressure %>% filter(rowid %in% training_indices)

# Create a testing set
test <- blood_pressure %>% filter(!(rowid %in% training_indices))
train = na.omit(train)




         