# Polynomial Regression

#Importing dataset
df = read.csv('Position_Salaries.csv')
df = df[2:3] #remove first column

# Fitting Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ ., data = df)
summary(lin_reg)

# Fitting Polynomial Regression to the dataset
df$Level2 = df$Level^2
df$Level3 = df$Level^3
df$Level4 = df$Level^4
pol_reg = lm(formula = Salary ~ ., data = df)
summary(pol_reg)

#Visualizing the Linear Regression results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = df$Level , y = df$Salary ), colour = 'red') + 
  geom_line(aes(x = df$Level , y = predict(lin_reg, newdata = df) ), colour = 'blue') +
  ggtitle('Linear Regression') + 
  xlab('Level') +
  ylab('Salary')


#Visualizing the Polynomial Regression results
ggplot() + 
  geom_point(aes(x = df$Level , y = df$Salary ), colour = 'red') + 
  geom_line(aes(x = df$Level , y = predict(pol_reg, newdata = df) ), colour = 'blue') +
  ggtitle('Polynomial Regression') + 
  xlab('Level') +
  ylab('Salary')

#Predicting a new result with Linear Regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))
y_pred

#Predicting a new result with Linear Regression

y_pol_pred = predict(pol_reg, data.frame(Level = 6.5, 
                                     Level2 = 6.5^2,
                                     Level3 = 6.5^3,
                                     Level4 = 6.5^4))
y_pol_pred

