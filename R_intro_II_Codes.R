#############################################################################
# Project: 'Tutorial on R Studio II'
# Author:  Shamar Stewart
# This program contains the R codes for this section
############################################################################

# Set seed number so that all the results based on random samples 
# are reproducible.

  set.seed(12345)
  
# Then create a normally distributed random variable, x, with 500 
# observations.
  x <- rnorm(500)
# Notice "<-" is the universal assignment operator in R (I prefer this to "=")


## R Script
####################################################
# Task 1 (-cont.-) 
####################################################
  
# At the top of the previous script,  write the following comments:
#   
#   1. The project
#   2. The author
#   3. The purpose of this program    
  
#############################################################
## R Basics
#############################################################
  
# Arithmetic


  1 + 1 #add numbers
  
  8 - 4 #subtract them
  
  13/2 #divide
  
  4*pi #multiply
  
  2^10 #exponentiate


#############################################################  
## R Script
#############################################################
  
#  Task 1 (-cont.-)
#  
# In one step: 
# 
# 1. Compute the difference between 2019 and the year you started at Virginia Tech 
# 2. Divide this by the difference between 2019 and the year you were born. 
# 3. Multiply this with 100 to get the percentage of your life you have spent at this university. 
# Use brackets if you need them.  
# 4. Assign this to a variable of your choosing
  

#############################################################
## Logical Comparison
#############################################################

  3 < 4
  3 > 4
  # Try 3 = 4
  3 == 4
  3 != 4
  10 - 6 == 4
  
# Notice the difference between single and double equal signs


#############################################################
## Strings (text)
#############################################################

#R delimits strings with EITHER double or single quotes.
#  There is only a very minimal difference
  
message1 <- 'Let us get to coding!'  
message2 <-  "Please get to coding!"  
print(message1)
print(message2)



#############################################################
## Variables
#############################################################

# - variable are used to store values and results. Assignment to a variable happens from right to left - the value on the right side gets assigned to the name on the left side. You can use nearly anything as a variable name in R. The only rules are:
#     
#     1. "." and "_" are OK, but no other symbols.
#     2. Your variable name must not start with a number or _ (2squared and  _one are illegal).  
#   
# - A note for those of you who have programming experience: while R supports object-oriented programming, periods "." do not have a special meaning in the language. For historical reasons, R programmers often use periods in place of underscores in variable names, but either works. Just be consistent to keep your code readable.
# 
# - `R` is case sensitive. Capitalization of variable names matter.

    x <- 42
    x / 2

    # redefine x
    x <- x + 3
    x
    
    #if we assign something else to x,
    #  the old value is deleted        
    x <- "Hokies!"
    x
    
    foo <- 3 
    bar <- 5
    foo.bar <- foo + bar
    foo.bar

#############################################################
## Clearing the memory
#############################################################
    
# To remove all variables in memory:

#    ls() # List of all variables in memory
    rm(list=ls())

 
# I usually place this at the begining of my `R` script (just after the document details). 
