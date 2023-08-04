# Task 1: Create a new script in R Studio and identify the current working directory and save it to the desired location
> 
> ##Get Current Working Directory
> getwd()
[1] "/home/labsuser"
> 
> ##Saving it to variable name location_wd
> location_wd = getwd()
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> # Task 2: Perform assignment operations by assigning numbers to the variables
> 
> ##Create 3 variables for operation purpose (x,y,z)
> 
> x = 3
> y = 5
> z = 10
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> #Task 3: Perform the basic arithmetic operations such as log, sum, and subtraction between two numbers
> 
> ## Arithmetic Operation Sum
> sum_func = x + y
> print(sum_func)
[1] 8
> print('--------------------------------------------')
[1] "--------------------------------------------"
> 
> ## Arithmetic Operation Subtraction
> sub_func = z - y
> print(sub_func)
[1] 5
> print('--------------------------------------------')
[1] "--------------------------------------------"
> 
> ## Arithmetic Operation Multiply
> mul_func = z*x
> print(mul_func)
[1] 30
> print('--------------------------------------------')
[1] "--------------------------------------------"
> 
> ## Arithmetic Operation Division
> div_func = z/y
> print(div_func)
[1] 2
> print('--------------------------------------------')
[1] "--------------------------------------------"
> 
> ## Logrithmic function
> log_func = log(z)
> print(log_func)
[1] 2.302585
> print('--------------------------------------------')
[1] "--------------------------------------------"
> 
> ## Square function
> Square_func = z**2
> print(Square_func)
[1] 100
> print('--------------------------------------------')
[1] "--------------------------------------------"
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> # Task 4: Create different types of variables in R (character, numeric, and factor) and check their class
> 
> ##Create variable of type character
> var_charcter = "Data is the new oil"
> print(var_charcter)
[1] "Data is the new oil"
> print('class of above variable is :')
[1] "class of above variable is :"
> print(class(var_charcter))
[1] "character"
> 
> ##Create variable of type Numeric
> var_numeric <- c(1,2,3)
> print(var_numeric)
[1] 1 2 3
> print('class of above variable is :')
[1] "class of above variable is :"
> print(class(var_numeric))
[1] "numeric"
> 
> ##Create factor variable
> my_vector <- c("category1", "category2", "category1", "category3", "category2")
> ### Convert the vector to a factor variable
> var_factor <- factor(my_vector)
> print(var_factor)
[1] category1 category2 category1 category3 category2
Levels: category1 category2 category3
> print('class of above variable is :')
[1] "class of above variable is :"
> print(class(var_factor))
[1] "factor"
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> # Task 5: Create a factor variable with two levels and summarize it
> ## Create a vector of values
> values <- c("Male", "Female", "Male", "Female")
> 
> ## Create a factor variable
> factor_values <- factor(values)
> 
> ## Summarize the factor variable
> summary(factor_values)
Female   Male 
     2      2 
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> # Task 6: Create a factor variable with two levels and summarize it
> ## Create a character vector
> my_char_vector <- c("This", "is", "my", "first", "assignment")
> 
> ## Create a numeric vector
> my_num_vector <- c(1, 2, 3, 4, 5)
> 
> ## Assign elements to the vectors
> my_char_vector[4] <- "second"
> print(my_char_vector)
[1] "This"       "is"         "my"         "second"     "assignment"
> my_num_vector[2] <- 6
> print(my_num_vector)
[1] 1 6 3 4 5
> 
> ## Summarize the vectors
> summary(my_char_vector)
   Length     Class      Mode 
        5 character character 
> summary(my_num_vector)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    1.0     3.0     4.0     3.8     5.0     6.0 
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> # Task 7: Perform mathematical and logical operations on vectors (subtraction, addition, multiplication, checking simple conditions as true or false, e.g., x>5)
> 
> # Subtraction
> x <- c(1, 2, 3, 4, 5)
> y <- c(6, 5, 4, 3, 2)
> 
> subtraction <- x - y
> print(subtraction)
[1] -5 -3 -1  1  3
> 
> ## Addition
> addition <- x + y
> print(addition)
[1] 7 7 7 7 7
> 
> ## Multiplication
> multiplication <- x * y
> print(multiplication)
[1]  6 10 12 12 10
> 
> ## Checking simple conditions as true or false
> print(x > 5)
[1] FALSE FALSE FALSE FALSE FALSE
> y <- 6
> print(x > y)
[1] FALSE FALSE FALSE FALSE FALSE
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> # Task 8: Create new vectors by adding new elements and deleting old elements from existing vectors 
> ## Create a vector
> x <- c(1, 2, 3, 4, 5)
> 
> ## Add a new element
> x <- c(x, 6)
> print(x)
[1] 1 2 3 4 5 6
> 
> ## Delete an element
> x <- x[-5]
> print(x)
[1] 1 2 3 4 6
> 
> ## Create a new vector with the elements of x that are greater than 3
> new_vector <- x[x > 3]
> print(new_vector)
[1] 4 6
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> #Task 9: Sort a numeric vector in ascending and descending order and a character vector in alphabetical order
> ## Numeric vector
> num_vector <- c(10, 5, 3, 2, 1)
> 
> ## Sort in ascending order
> num_vector_sorted_ascending <- sort(num_vector)
> print(num_vector_sorted_ascending)
[1]  1  2  3  5 10
> 
> ## Sort in descending order
> num_vector_sorted_descending <- sort(num_vector, decreasing = TRUE)
> print(num_vector_sorted_descending)
[1] 10  5  3  2  1
> 
> ## Character vector
> char_vector <- c("a", "c", "b", "d")
> 
> ## Sort in alphabetical order
> char_vector_sorted_ascending <- sort(char_vector)
> print(char_vector_sorted_ascending)
[1] "a" "b" "c" "d"
> 
> ## Sort in reverse alphabetical order
> char_vector_sorted_descending <- sort(char_vector, decreasing = TRUE)
> print(char_vector_sorted_descending)
[1] "d" "c" "b" "a"
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> # Task 10:Create a numeric vector and a user-defined function to compute the mean of the vector
> # Create a numeric vector
> x <- c(1, 2, 3, 4, 5)
> 
> mean_vector <- function(x) {
+   sum(x) / length(x)
+ }
> 
> # Compute the mean of the vector
> mean_x <- mean_vector(x)
> 
> # Print the mean of the vector
> print(mean_x)
[1] 3
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> #Task 11:Create a matrix with the combination of multiple variables
> 
> x <- c(1, 2, 3)
> y <- c("a", "b", "c")
> z <- c(10, 20, 30)
> 
> # Create a matrix with the combination of the three variables
> matrix_with_combination <- expand.grid(x, y, z)
> 
> # Print the matrix
> print(matrix_with_combination)
   Var1 Var2 Var3
1     1    a   10
2     2    a   10
3     3    a   10
4     1    b   10
5     2    b   10
6     3    b   10
7     1    c   10
8     2    c   10
9     3    c   10
10    1    a   20
11    2    a   20
12    3    a   20
13    1    b   20
14    2    b   20
15    3    b   20
16    1    c   20
17    2    c   20
18    3    c   20
19    1    a   30
20    2    a   30
21    3    a   30
22    1    b   30
23    2    b   30
24    3    b   30
25    1    c   30
26    2    c   30
27    3    c   30
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> #Task 12:Create a data frame with multiple variables and check the class of each variable in the data frame and summarize it
> 
> df <- data.frame(
+   experience = c(1, 2, 3, 4, 5),
+   name = c("Amit", "Akriti", "Yashu", "Manasvi", "Tanmay"),
+   state = c("Maharashtra", "Uttarakhand", "Karnataka", "Tamil Nadu", "Delhi"),
+   salary = c(100000, 200000, 300000, 400000, 500000),
+   Gender = c("Male","Female","Female","Female","Male")
+ )
> 
> ## Check the class of each variable in the data frame
> str(df)
'data.frame':	5 obs. of  5 variables:
 $ experience: num  1 2 3 4 5
 $ name      : chr  "Amit" "Akriti" "Yashu" "Manasvi" ...
 $ state     : chr  "Maharashtra" "Uttarakhand" "Karnataka" "Tamil Nadu" ...
 $ salary    : num  1e+05 2e+05 3e+05 4e+05 5e+05
 $ Gender    : chr  "Male" "Female" "Female" "Female" ...
> 
> ## Summarize the data frame
> summary(df)
   experience     name              state               salary         Gender         
 Min.   :1    Length:5           Length:5           Min.   :1e+05   Length:5          
 1st Qu.:2    Class :character   Class :character   1st Qu.:2e+05   Class :character  
 Median :3    Mode  :character   Mode  :character   Median :3e+05   Mode  :character  
 Mean   :3                                          Mean   :3e+05                     
 3rd Qu.:4                                          3rd Qu.:4e+05                     
 Max.   :5                                          Max.   :5e+05                     
> 
> ##check for factor in Gender Variable
> factor(df$Gender)
[1] Male   Female Female Female Male  
Levels: Female Male
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"
> 
> # Task 13:Import new data (Employee details.csv) into the R environment and assign a name to it
> 
> ##Load the dataset
> employee_details <- read.csv('~/Module_2_Assignment/Employee_detail.csv')
> 
> # Assign a name to the data frame
> df <- employee_details
> 
> # Check the class of the data frame
> class(df)
[1] "data.frame"
> 
> # Summarize the data frame
> summary(df)
    MMM.YY              Emp_ID          Age           Gender              City          
 Length:19104       Min.   :   1   Min.   :21.00   Length:19104       Length:19104      
 Class :character   1st Qu.: 710   1st Qu.:30.00   Class :character   Class :character  
 Mode  :character   Median :1417   Median :34.00   Mode  :character   Mode  :character  
                    Mean   :1416   Mean   :34.65                                        
                    3rd Qu.:2137   3rd Qu.:39.00                                        
                    Max.   :2788   Max.   :58.00                                        
 Education_Level        Salary       Dateofjoining      LastWorkingDate    Joining.Designation
 Length:19104       Min.   : 10747   Length:19104       Length:19104       Min.   :1.000      
 Class :character   1st Qu.: 42383   Class :character   Class :character   1st Qu.:1.000      
 Mode  :character   Median : 60087   Mode  :character   Mode  :character   Median :1.000      
                    Mean   : 65652                                         Mean   :1.691      
                    3rd Qu.: 83969                                         3rd Qu.:2.000      
                    Max.   :188418                                         Max.   :5.000      
  Designation    Total.Business.Value Quarterly.Rating
 Min.   :1.000   Min.   :-6000000     Min.   :1.000   
 1st Qu.:1.000   1st Qu.:       0     1st Qu.:1.000   
 Median :2.000   Median :  250000     Median :2.000   
 Mean   :2.253   Mean   :  571662     Mean   :2.009   
 3rd Qu.:3.000   3rd Qu.:  699700     3rd Qu.:3.000   
 Max.   :5.000   Max.   :33747720     Max.   :4.000   
> 
> paste(rep("*", 200), collapse = "")
[1] "********************************************************************************************************************************************************************************************************"