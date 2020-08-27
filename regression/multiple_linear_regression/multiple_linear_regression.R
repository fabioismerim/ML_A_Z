# Multiple Linear Regression

# Importing the dataset
df = read.csv('50_Startups.csv')

#Encoding categorical Data:

df$State = factor(df$State, levels = c('New York', 'California', 'Florida'), labels = c(1,2,3))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(df$Profit, SplitRatio = 0.8)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# Feature Scaling
# We don't need Feature Scaling in Multiple Linear Regression

#Fitting Multiple Linear Regression to the Training Set
regressor = lm(formula = Profit ~ ., data = training_set)

#take a look in the regressor variables:
summary(regressor)

# Predicting the Test set Results
y_pred = predict(regressor, newdata = test_set)
y_pred

# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = df)
summary(regressor)

#Removing variable with p-value > 0.05  (State)
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, data = df)
summary(regressor)

#Removing variable with p-value > 0.05  (administration)
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = df)
summary(regressor)

#Removing variable with p-value > 0.05  ( Marketing.Spend)
regressor = lm(formula = Profit ~ R.D.Spend, data = df)
summary(regressor)