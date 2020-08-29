#SVR

#Import dataset
df = read.csv('Position_Salaries.csv')
df = df[2:3] #remove first column

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)
# 
# # Feature Scaling
# # training_set = scale(training_set)
# # test_set = scale(test_set)


# Fitting SVR Model to the dataset
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ ., data = df, type = 'eps-regression')

#Predicting a new result

y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred


#Visualizing the Regression SVR results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = df$Level , y = df$Salary ), colour = 'red') + 
  geom_line(aes(x = df$Level , y = predict(regressor, newdata = df) ), colour = 'blue') +
  ggtitle('SVR Model') + 
  xlab('Level') +
  ylab('Salary')


#Visualizing the Regression Model results (for higher resolution and smoother curve)
x_grid = seq(min(df$Level), max(df$Level), 0.1)
ggplot() + 
  geom_point(aes(x = df$Level , y = df$Salary ), colour = 'red') + 
  geom_line(aes(x = x_grid , y = predict(regressor, newdata = data.frame(Level = x_grid))), colour = 'blue') +
  ggtitle('SVR Model') + 
  xlab('Level') +
  ylab('Salary')

