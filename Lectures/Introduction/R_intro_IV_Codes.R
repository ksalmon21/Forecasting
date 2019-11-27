#############################################################################
# Project: 'Tutorial on R Studio IV'
# Author:  Shamar Stewart
# This program illustrates changing directories and using functions
############################################################################  

rm(list=ls())

##################################################
# Create Directory and Set working directory
##################################################

# Getting the current directory that `R` is using

getwd()

# It is good practice to set the working directory where the files and data will be stored.
# Consider setting your working directory to a folder called AAEC4984 or AAEC5984 on your desktop (for example)

  # Windows
  setwd("C:/users/[your user name]/Desktop/AAEC4984/")
  # OR
  setwd("C:\\users\\[your user name]\\Desktop\\AAEC4984/") # notice the double backslashes
  
  # Mac
  setwd("~/Desktop/AAEC4984")


# Check whether the wd is correct
  getwd()

# List the folders in your directory
  dir()

# Create a new folder in your directory
  dir.create()
  

##################################################
# Function
##################################################
  
# Consider for example, taking the average of a set of random numbers (x). 

set.seed(124) 
x <- rnorm(6) * 100
(round(x, digits=2)) # round function => 2dp

# If we were to do this manually, we would:

# 1. Sum up the values 
sumx <- sum(x)

# 2. Get the number of observations
nx <- length(x)
  

# 3. Divide sum by total number of observations
meanx <- sumx/nx

# Using `R`'s built in `mean` functions we can do all three steps internally and cross check against our manual calculations.

mean(x)
meanx == mean(x) # cross validation

##################################################
## Installing Packages
##################################################

# To install the `fpp2` package, we can use the command
install.packages("fpp2")

# Now that you have the `fpp2` package installed, we can check to see if it is in use
search()

# Lastly, in order to use the package, we will need to load the library 
library(fpp2)

##################################################
## Using libraries 
##################################################

# The `fpp2` package contains a number of useful datasets. One such data set is `h02`. 
# Use the `help()` function to get a decription of this data. Try

help(h02)

#Now let us create a nice plot of the `h02` data
autoplot(h02)

