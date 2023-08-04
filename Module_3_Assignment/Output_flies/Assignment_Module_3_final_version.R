####################### Module 3 Assignment ##########################################


##Get Current Working Directory
getwd()

##Set working Directory to current folder
setwd('~/Module_3_Assignment/')

###Load and Install Required Packages
install.packages('readxl')
install.packages('modeest')
install.packages('moments')
install.packages('dplyr')
install.packages("ggplot2")
install.packages("plotly")
install.packages("tibble")
install.packages("tibble")
install.packages("tibble")
install.packages("BSDA")

library(readxl)
library(modeest)
library(moments)
library(dplyr)
library(ggplot2)
library(plotly)
library(tibble)
library(BSDA)

##*********************************************************************************************##

## Task 1:Import the data to check its class and structure and display the head and tail of the data

#Import data
input_df <- read_excel('Input_data.xlsx')
print('------------------------')
#Check the class of the data frame
class(input_df)
print('------------------------')
#Check the structure of the data frame
str(input_df)
print('------------------------')
#Print the head of dataframe
head(input_df)
print('------------------------')

#Print the tail of dataframe
tail(input_df)
print('------------------------')

##*********************************************************************************************##

## Task 2: Calculate variaous parameters (listed below)

#a.Difference in the means of the pre and post variables
diff_mean = mean(input_df$Pre, na.rm = T) - mean(input_df$Post,na.rm = T)
print(diff_mean)
print('------------------------')


#b.Values that divide the pre and post variable data into equal halves : MEDIAN
pre_median = median(input_df$Pre, na.rm = T)
print(pre_median)
print('------------------------')

post_median = median(input_df$Post, na.rm = T)
print(post_median)
print('------------------------')

#c.Mode for the pre variable
pre_mode <- mfv(input_df$Pre)
print(pre_mode)
print('------------------------')

#d.First and third quantile for the pre and post variables
pre_q1 <- quantile(input_df$Pre, 0.25)
print(pre_q1)
print('------------------------')
pre_q3 <- quantile(input_df$Pre, 0.75)
print(pre_q3)
print('------------------------')

post_q1 <- quantile(input_df$Post, 0.25)
print(post_q1)
print('------------------------')
post_q3 <- quantile(input_df$Post, 0.75)
print(post_q3)
print('------------------------')

#e.Range of the pre and post variables
pre_range <- range(input_df$Pre)
print(pre_range)
print('------------------------')
post_range <- range(input_df$Post)
print(post_range)
print('------------------------')

#f.Variance and standard deviation for the pre and post variables
pre_variance <- var(input_df$Pre)
print(pre_variance)
print('------------------------')
post_variance <- var(input_df$Post)
print(post_variance)
print('------------------------')

pre_sd <- sd(input_df$Pre)
print(pre_sd)
print('------------------------')
post_sd <- sd(input_df$Post)
print(post_sd)
print('------------------------')

#g.Coefficient of variation and mean absolute deviation for the pre and post variables
pre_cv <- sd(input_df$Pre) / mean(input_df$Pre) * 100
print(pre_cv)
print('------------------------')
post_cv <- sd(input_df$Post) / mean(input_df$Post) * 100
print(post_cv)
print('------------------------')

pre_mad <- mean(abs(input_df$Pre - mean(input_df$Pre)))
print(pre_mad)
print('------------------------')

post_mad <- mean(abs(input_df$Post - mean(input_df$Post)))
print(post_mad)
print('------------------------')

#h.Interquartile range of the pre and post variables
pre_iqr <- pre_q3 - pre_q1
print(pre_iqr)
print('------------------------')

post_iqr <- post_q3 - post_q1
print(post_iqr)
print('------------------------')


##*********************************************************************************************##

## Task 3:Measure the skewness for pre and post variables and apply the Agostino test to check the skewness

# Calculate the skewness for the Pre variable
skewness_pre <- skewness(input_df$Pre)
print(skewness_pre)
print('------------------------')

# Calculate the skewness for the Post variable
skewness_post <- skewness(input_df$Post)
print(skewness_post)
print('------------------------')

# Apply the Agostino test to the Pre variable
agostino_test_pre <- agostino.test(input_df$Pre)
print(agostino_test_pre)
print('------------------------')

# Apply the Agostino test to the Post variable
agostino_test_post <- agostino.test(input_df$Post)
print(agostino_test_post)
print('------------------------')

##*********************************************************************************************##

## Task 4:Identify the nature of distribution through kurtosis for both pre and post variables and confirm the result through the Anscombe test

# Calculate the kurtosis for the Pre variable
kurtosis_pre <- kurtosis(input_df$Pre)
print(kurtosis_pre)
print('------------------------')

# Calculate the kurtosis for the Post variable
kurtosis_post <- kurtosis(input_df$Post)
print(kurtosis_post)
print('------------------------')

# Apply the Anscombe test to the Pre variable
anscombe_test_pre <- anscombe.test(input_df$Pre)
print(anscombe_test_pre)
print('------------------------')

# Apply the Anscombe test to the Post variable
anscombe_test_post <- anscombe.test(input_df$Post)
print(anscombe_test_post)
print('------------------------')


##*********************************************************************************************##

## Task 5:Plot a graph to check the skewness and peakedness in the distribution of pre and post variables

# Plot the distribution of the pre variable
plot(density(input_df$Pre), main="Distribution of Pre Variable",
     xlab="Value", ylab="Density",
     sub=paste("Skewness:", skewness_pre, "Kurtosis:", kurtosis_pre))

print('-----------------------')

# Plot the distribution of the post variable
plot(density(input_df$Post), main="Distribution of Post Variable",
     xlab="Value", ylab="Density",
     sub=paste("Skewness:", skewness_post, "Kurtosis:", kurtosis_post))

print('-----------------------')

##*********************************************************************************************##

## Task 6:Compute the frequency and relative frequency for each brand of cold drink

# Calculate the frequency and relative frequency for each brand
df_grouped <- input_df %>%
  group_by(input_df$`Cold-Drink`) %>%
  summarise(
    frequency = n(),
    relative_frequency = n() / dim(input_df)[1]
  )

# Rename the column
df_grouped <- df_grouped %>%
  rename(cold_drink = `input_df$\`Cold-Drink\``)

print(df_grouped)

print('-----------------------')

##*********************************************************************************************##

## Task 7:Create a pie chart and bar chart to show the preferences of the cold drinks available and provide the necessary labels

# Create a pie chart
pie_chart <- df_grouped %>% 
  plot_ly(labels = ~cold_drink,values = ~frequency, type = "pie") %>%  
  layout(title = "Preferences of Cold Drinks",
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))  

pie_chart

# Create a bar chart
bar_chart = plot_ly(data = df_grouped,
  x = ~cold_drink,
  y = ~frequency,
  type = "bar"
)
# Print the bar chart
bar_chart


##*********************************************************************************************##

## Task 8:Plot a density graph on the cold-drink frequency and comment on the skewness and kurtosis

# Plot the distribution of the cold-drink frequency

plot(density(df_grouped$frequency), main="Distribution of cold-drink frequency",
     xlab="Value", ylab="Density")
print('-----------------------')

kurtosis_value = kurtosis(df_grouped$frequency)

# Comment on Skewness and Kurtosis
print("The plot looks bit drifted toward right, hence it indicates that the distribution is slightly skewed to the right.")
print(paste("The kurtosis is", kurtosis_value, ". This indicates that the distribution is slightly leptokurtic."))


##*********************************************************************************************##

## Task 9:Convert the ‘Status’, ‘Rating’, and ‘Outlook’ variables into factor types and summarize them

# Convert the variable to factor type
input_df$Status <- as.factor(input_df$Status)
input_df$Rating <- as.factor(input_df$Rating)
input_df$Outlook <- as.factor(input_df$Outlook)

# summarize above fvariables
summary(input_df$Status)
print('-----------------------')
summary(input_df$Rating)
print('-----------------------')
summary(input_df$Outlook)
print('-----------------------')


##*********************************************************************************************##

## Task 10: Calculate the difference in the average pre-training satisfaction ratings of member and observer status and for the post-training member and observer status

# Group the data by status
status_grouped_data <- input_df %>% group_by(Status)

# Calculate the mean of Pre and Post satisfaction ratings
mean_pre <- status_grouped_data %>% summarise(mean_pre = mean(Pre))
mean_post <- status_grouped_data %>% summarise(mean_post = mean(Post))

# Combine the mean of Pre and Post satisfaction ratings into a single data frame
status_results <- merge(mean_pre, mean_post, by = "Status")

# Calculate the difference between observer and member values
difference_mean_pre <- status_results$mean_pre[2] - status_results$mean_pre[1]
difference_mean_post <- status_results$mean_post[2] - status_results$mean_post[1]

# Print the difference
print(difference_mean_pre)
print('-----------------------')
print(difference_mean_post)
print('-----------------------')

##*********************************************************************************************##

## Task 11:Compute the average pre-satisfaction and post-satisfaction ratings of employees with a ‘Stable’ Outlook

# Filter the data for employees with a Stable Outlook
data_stable <- input_df %>% filter(toupper(Outlook) == "STABLE")

# Calculate the average pre-satisfaction rating
mean_pre_stable <- mean(data_stable$Pre)

# Calculate the average post-satisfaction rating
mean_post_stable <- mean(data_stable$Post)

# Print the results
print(paste("The average pre-satisfaction rating for employees with a Stable Outlook is", mean_pre_stable))
print(paste("The average post-satisfaction rating for employees with a Stable Outlook is", mean_post_stable))

##*********************************************************************************************##

## Task 12: Construct a confidence interval at a 2.5%, 5%, and 1% level of significance for the salary variable

# Calculate the sample mean and standard deviation of the salary variable
mean_salary <- mean(input_df$Salary)
sd_salary <- sd(input_df$Salary)

# Calculate the confidence intervals
ci_2.5 <- mean_salary + c(-1.96, 1.96) * sd_salary
ci_5 <- mean_salary + c(-1.645, 1.645) * sd_salary
ci_1 <- mean_salary + c(-2.576, 2.576) * sd_salary


# Print the confidence intervals
print(paste("The mean salary is :",mean_salary))
print('-----------------------')
print(paste("The 95% confidence interval for the salary variable is", ci_5[1],"to", ci_5[2] ))
print('-----------------------')
print(paste("The 90% confidence interval for the salary variable is", ci_2.5[1],"to",ci_2.5[2]))
print('-----------------------')
print(paste("The 99% confidence interval for the salary variable is", ci_1[1],"to",ci_1[2]))
print('-----------------------')

##*********************************************************************************************##

## Task 13:Construct a 99%, 95%, and 90% confidence interval estimate for the pre and post variables

# Calculate the mean and standard deviation of the pre variable
mean_pre <- mean(input_df$Pre)
std_dev_pre <- sd(input_df$Pre)

# Calculate the confidence intervals
ci_99_pre <- mean_pre + c(-2.576, 2.576) * std_dev_pre
ci_95_pre <- mean_pre + c(-1.96, 1.96) * std_dev_pre
ci_90_pre <- mean_pre + c(-1.645, 1.645) * std_dev_pre

#Print the confidence Interval for Pre Variable
print(paste("The mean salary of Pre variable is :",mean_pre))
print('-----------------------')
print(paste("The 99% confidence interval for the pre variable is", ci_99_pre[1],"to", ci_99_pre[2]))
print('-----------------------')
print(paste("The 95% confidence interval for the pre variable is", ci_95_pre[1],"to", ci_95_pre[2]))
print('-----------------------')
print(paste("The 90% confidence interval for the pre variable is", ci_90_pre[1],"to", ci_90_pre[2]))
print('-----------------------')

# Calculate the mean and standard deviation of the post variable
mean_post <- mean(input_df$Post)
std_dev_post <- sd(input_df$Post)

# Calculate the confidence intervals
ci_99_post <- mean_post + c(-2.576, 2.576) * std_dev_post
ci_95_post <- mean_post + c(-1.96, 1.96) * std_dev_post
ci_90_post <- mean_post + c(-1.645, 1.645) * std_dev_post

#Print the confidence Interval for Post Variable
print(paste("The mean salary of Post variable is :",mean_post))
print('-----------------------')
print(paste("The 99% confidence interval for the post variable is", ci_99_post[1],"to", ci_99_post[2]))
print('-----------------------')
print(paste("The 95% confidence interval for the post variable is", ci_95_post[1],"to", ci_95_post[2]))
print('-----------------------')
print(paste("The 90% confidence interval for the post variable is", ci_90_post[1],"to", ci_90_post[2]))


##*********************************************************************************************##

## Task 14:Solve the below tasks:

# Task 14a:Take a sample of 50 observations from the pre and post dataset (without replacement)

# Create a sample of 50 observations from the pre variable
sample_pre <- sample(input_df$Pre, 50, replace = T)

# Create a sample of 50 observations from the post variable
sample_post <- sample(input_df$Post, 50, replace = T)

# Combine the two samples into a single data frame
sample <- cbind(sample_pre, sample_post)
sample_df <- as.data.frame(sample)
# Print the sample
print(sample_df)

print('*********************************************')

# Task 14b:Construct a null hypothesis to examine whether the sample (50 observations) mean score of pre and post variables is significantly different from the population (1000 observations)

# Calculate the mean of the pre variable in the population
mean_pre_population <- mean(input_df$Pre)

# Calculate the mean of the post variable in the population
mean_post_population <- mean(input_df$Post)

# Calculate the mean of the pre variable in the sample
mean_pre_sample <- mean(sample_df$sample_pre)

# Calculate the mean of the post variable in the sample
mean_post_sample <- mean(sample_df$sample_post)

# Construct the null hypothesis
# H0: There is no significant difference between the mean score of pre and post variables in the population and the sample

print("H0: There is no significant difference between the mean score of pre and post variables in the population and the sample")

print('*********************************************')

# Task 14c:Compute corresponding Z values for pre and post variables in the sample

# Calculate the mean of the pre variable in the sample
mean_pre_sample <- mean(sample_df$sample_pre)

# Calculate the standard deviation of the pre variable in the sample
std_dev_pre_sample <- sd(sample_df$sample_pre)

# Calculate the z-score for the pre variable
z_pre <- (sample_df$sample_pre - mean_pre_sample) / std_dev_pre_sample

# Calculate the mean of the post variable in the sample
mean_post_sample <- mean(sample_df$sample_post)

# Calculate the standard deviation of the post variable in the sample
std_dev_post_sample <- sd(sample_df$sample_post)
# Calculate the z-score for the post variable
z_post <- (sample_df$sample_post - mean_post_sample) / std_dev_post_sample

# Print the z-scores
print(z_pre)
print(z_post)

print('*********************************************')

##*********************************************************************************************##

## Task 15: Using the p-value method, determine whether the sample mean for the pre and post variables differs significantly from the population mean at the 10% significance level 

###Starting with Z Test Hypothesis Testing####

# Calculate the mean of the pre variable in the population
mean_pre_population <- mean(input_df$Pre)

# Calculate the sd of the pre variable in the population
sd_pre_population <- sd(input_df$Pre)

# Calculate the mean of the post variable in the population
mean_post_population <- mean(input_df$Post)

# Calculate the sd of the pre variable in the population
sd_post_population <- sd(input_df$Post)

z.test(sample_pre, sample_post, alternative = 'two.sided', 
       conf.level = 0.90, sigma.x = sd_pre_population, sigma.y = sd_post_population)

p_value_pre_post <- z.test(sample_pre, sample_post, alternative = 'two.sided', 
       conf.level = 0.90, sigma.x = sd_pre_population, sigma.y = sd_post_population)$p.value

print(p_value_pre_post)
print('-----------------------')
print(paste("Observation based on Results:", "As the p-value is < 0.05 it clearly states that  
            there is a significant difference in mean of 2 categories. The same can be validated 
            by looking at the mean of Pre and Post sample"))
print('-----------------------')


##*********************************************************************************************##

## Task 16:	Calculate the critical Z value for the 10% level of significance and the decision rule using the critical value approach

###Starting with Z Test Hypothesis Testing####
z.test(sample_pre, sample_post, alternative = 'two.sided', 
       conf.level = 0.90, sigma.x = sd_pre_population, sigma.y = sd_post_population)

critical_z_value = qnorm(p = 0.1/2, lower.tail = T) ## As Z-value is negative
print(critical_z_value)
print('-----------------------')


##*********************************************************************************************##

## Task 17: Compute the T-statistics value for the pre and post variables

###Hypothesis Testing using T-Distribution###

t.test(sample_pre, sample_post, alternative = 'two.sided', conf.level = 0.90)

t.test(sample_pre, sample_post, alternative = 'greater', conf.level = 0.90)

t.test(sample_pre, sample_post, alternative = 'less', conf.level = 0.90)

print(paste(" Difference in Post and Pre sample mean: ",mean_post_sample - mean_pre_sample))

print('-----------------------')

print("The above three test confirms that there is a significant difference in Pre and Post Training 
      the p-value is quite significant in two-sample test, suggesting there is a statistically significant 
      difference is score of Pre and post survey. And the One-tail test confirms that the post sample mean is better than Pre-sample mean")



##*********************************************************************************************##

## Task 18:	Calculate the p-value and the decision using the p-value approach for pre and post variables at a 10% level of significance

p_value_pre <- t.test(sample_pre, alternative = 'two.sided', 
                           conf.level = 0.90)$p.value

print(p_value_pre)
print('-----------------------')

p_value_post <- t.test(sample_post, alternative = 'two.sided', 
                      conf.level = 0.90)$p.value

print(p_value_post)

print('-----------------------')


##*********************************************************************************************##

## Task 19:Calculate the critical T value for the level of significance of 10% and the decision rule using the critical value approach

###Hypothesis Testing using T-Distribution###

t.test(sample_pre, sample_post, alternative = 'two.sided', conf.level = 0.90)

DOF <- length(sample_pre) - 1
print(DOF)
print('-----------------------')

critical_t_value <- qt(p = 0.1/2, df = DOF, lower.tail = T)## As t-value is negative
print(critical_t_value)
print('-----------------------')

##*********************************************************************************************##