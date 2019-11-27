#############################################################################
# Project: 'Tutorial on R Studio III'
# Author:  Shamar Stewart
# This program contains the R codes for this section
############################################################################  

rm(list=ls())

##################################################################
# Data classes
## You can check the type of data by using `class()`. 
##################################################################

x <- "Melody to Old Town Road!"
class(x)

x <- c("TRUE", "FALSE")
x <- as.logical(x) #Declare the data type
class(x)
x <- 1:20
x %% 4 #x mod 4
x %% 4 == 0
class(x %% 4 == 0)


##################################################################
## A collection of data points
## Vectors 
##################################################################

### Some basic examples
  
(v <- c(1, 2, 3, 4))
(v <- 1:4)
(v <- seq(from = 0, to = 0.5, by = 0.1))

#A vector can also contain characters:	
(v_colors <- c("blue", "yellow", "light green")	)


## Subsetting vectors (Indexing/reassigning elements)

v_colors[2]         
v_colors[c(1, 3)]   
(v_colors[2:3]  <- c("red", "purple")	)
j <- c(-1,-2,-3)
x[j]


## Conditional subsetting

x <- 100:110
# returns TRUE or FALSE depending on which elements that meet the condition
x >105 
select <- x > 105
x[x > 105]

# x is between 103 and 106
x[x >= 103 & x <= 106]


# x is greater than 103 but less than or equal to 106
x[x <= 106 & x > 103] # order of subsetting does not matter here!

# x is less than 103 `or` greater than 106
x[x >= 106 | x < 103] 


##################################################################
## Using %in% function
##################################################################
  
animals <- c("mouse", "rat", "dog", "cat")
animals[animals == "cat" | animals == "rat"] # returns both rat and cat

animals %in% c("rat", "cat", "dog", "duck", "goat")
animals[animals %in% c("rat", "cat", "dog", "duck", "goat")]


 ##################################################################  
## Names of a vector
##################################################################

v_colors
names(v_colors) <- c("Thomas", "Liz", "Tucker")
v_colors

##################################################################
## Algebraic Operations of Vectors
##################################################################

x <- c(1,2,3)
y <- c(4,5,6)
# component-wise addition
x+y
# component-wise multiplication
x*y
# What happens to the following
y^x # or y**x


##################################################################
## Repeating Vector in `R`
##################################################################

# Would this work?
c(1,2,3,4) + c(1,2)

# Would this work?
c(1,2,3) + c(1,2)

# Why the weird results?*

2*c(1,2,3)

##################################################################
## Matrix
##################################################################

# Create a new matrix

(matrix<-matrix(1:16, nrow = 4, byrow = TRUE))



##################################################################
## Selection of Matrix Elements
##################################################################

#Extract element in the first row and second column
matrix[1,2] 
#Extract the entire first row and second columns 
matrix[,1:2] 


##################################################################
## Assign dimension names to Matrix
##################################################################

	rownames(matrix) <- c("Yes", "No", "Perhaps", "Maybe")
	colnames(matrix) <- c("Apple", "Pear", "Banana", "Grapes")
	matrix

##################################################################
## Dimension of a matrix vs vector
##################################################################

x <- c(1,2,3)
matrix<-matrix(1:4, byrow = TRUE, nrow = 2)
length(x)
length(matrix)
dim(matrix)
dim(x)


##################################################################
## Lists
##################################################################

# `R` doesn't like vectors to have different types: `c(TRUE, 1, "Frank")` becomes `c("TRUE", "1", "Frank")`.

c(TRUE, 1, "Frank")

x <- list(TRUE, 1, "Frank")


# Many different things not necessarily of same length can be put together. 


x <- list(c(1:5), c("a", "b","c"), c(TRUE, FALSE), c(5L, 6L))
x

##################################################################	
## Dataframes
##################################################################

View(iris)


##################################################################
## Create a data frame
##################################################################

# Data frame with Harry Potter characters

name <- c("Harry", "Ron", "Hermione", "Hagrid", "Voldemort")	
height <- c(176, 175, 167, 230, 180)	
gpa <- c(3.4, 2.8, 4.0, 2.2, 3.4)	
df_students <- data.frame(name, height, gpa)  		
df_students	


 
##################################################################  
##  Alternative way of creating DF
##################################################################
df_students <- data.frame(name = c("Harry", "Ron", "Hermione", "Hagrid",
                                   "Voldemort"), 	
                          height = c(176, 175, 167, 230, 180), 	
                          gpa = c(3.4, 2.8, 4.0, 2.2, 3.4))	
df_students


##################################################################
## Adding variable
##################################################################

df_students$good <- c(1, 1, 1, 1, 0)   	
df_students	


##################################################################
## Features of the DF
##################################################################

dim(df_students)  		
df_students[2, 3]               #Ron's GPA
df_students$gpa[2]              #Ron's GPA
df_students[5, ]                #get row 5
df_students[3:5, ]              #get rows 3-5
df_students[, 2]                #get column 2 (height)
df_students$height              #get column 2 (height)
df_students[, 1:3]              #get columns 1-3
df_students[4, 2] <- 255        #reassign Hagrid's height
df_students$height[4] <- 255    #same thing as above
df_students		


