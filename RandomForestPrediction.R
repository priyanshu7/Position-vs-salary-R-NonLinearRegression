#Random Forest Regression

#Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


#Fitting data in random forest regression model
#create regressor here
install.packages('randomForest')
library('randomForest')
set.seed(1234)
regressor = randomForest(x = dataset[1], #dataframe
                         y = dataset$Salary, #vector
                         ntree = 500)

#Predicting results of regression
y_pred = predict(regressor , newdata = data.frame(Level = 6.5))



#Visualising random forest Regression model results (Smoother Curves and higher resolution)

x_grid = seq(min(dataset$Level) , max(dataset$Level), 0.01)
ggplot () +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid , y = predict(regressor , newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth Or Bluff (Random Forest Regression)')+
  xlab('Level') +
  ylab('Salary')