#Decision Tree Regression

#Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


#Fitting data in regression model
install.packages('rpart')
library('rpart')
regressor = rpart(formula = Salary~.,
                  data = dataset,
                  control = rpart.control(minsplit = 1))


#Predicting results of regression
y_pred = predict(regressor , newdata = data.frame(Level = 6.5))

#Visualising Regression model results
ggplot () +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(regressor , newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth Or Bluff (Decision Tree Model)')+
  xlab('Level') +
  ylab('Salary')


#Visualising Regression model results (Smoother Curves and higher resolution)

x_grid = seq(min(dataset$Level) , max(dataset$Level), 0.01)
ggplot () +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid , y = predict(regressor , newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth Or Bluff (Decision Tree Regression Model)')+
  xlab('Level') +
  ylab('Salary')