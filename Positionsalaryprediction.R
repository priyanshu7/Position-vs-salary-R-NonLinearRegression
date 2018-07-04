#Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set not required as data is small

#Fitting data in linear regression model

lin_reg = lm(formula = Salary ~ . ,
             data = dataset)
#Fitting data in Polynoial regression model
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ . ,
              data = dataset)

#Visualising Linear model results
library(ggplot2)
ggplot () +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(lin_reg , newdata = dataset)),
             colour = 'blue') +
  ggtitle('Truth Or Bluff (Linear Regression)')+
  xlab('Level') +
  ylab('Salary')

#Visualising Polynomial Regression model results
ggplot () +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(poly_reg , newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth Or Bluff (Polynomial Regression)')+
  xlab('Level') +
  ylab('Salary')

#Predicting results linear regression
y_pred = predict(lin_reg , newdata = data.frame(Level = 6.5))


#Predicting results polynomial regression
y_pred = predict(poly_reg , newdata = data.frame(Level = 6.5,
                                                 Level2 = 6.5^2,
                                                 Level3 = 6.5^3,
                                                 Level4 = 6.5^4))
