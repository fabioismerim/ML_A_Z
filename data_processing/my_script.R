#Data Preprocessing

# Importing the Dataset

df = read.csv('Data.csv')

# Taking care of missing data
## Age Column: fill missing values with mean of column

df$Age = ifelse(is.na(df$Age),
                ave(df$Age, FUN = function(x) mean (x, na.rm = TRUE)),
                df$Age)

## The same to Salary column:

df$Salary = ifelse(is.na(df$Salary),
                ave(df$Salary, FUN = function(x) mean (x, na.rm = TRUE)),
                df$Salary)

#Encoding categorical Data:

df$Country = factor(df$Country, levels = c('France', 'Spain', 'Germany'), labels = c(1,2,3))

df$Purchased = factor(df$Purchased, levels = c('No', 'Yes'), labels = c(0,1))

#Splitting the dataset into the Training set and Test set
#install.packages('caTools')

library(caTools)
set.seed(123)
split = sample.split(df$Purchased, SplitRatio = 0.8)

training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# Feature Scaling

training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])




