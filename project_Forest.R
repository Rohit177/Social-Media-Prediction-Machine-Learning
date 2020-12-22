#import dataset
dataset <- read.csv("Social_Data.csv")
str(dataset)
summary(dataset)

#Split data in train and test data
library(caTools)

split <- sample.split(dataset, SplitRatio = 0.8)
split

train<- subset(dataset, split== "TRUE")
test<- subset(dataset, split== "FALSE")

str(train)
str(test)


#First Prediction of communication with teacher

set.seed(415) #split data, 80% as train and 20% as test
library(randomForest)

#Training model with Random Forest
fit <- randomForest(as.factor(Comm_teacher) ~ .,
                    data=train, ntree=10)

#Predict test data based on trained logistic model
fitted.results <- predict(fit,newdata=test)

#Evauate Model Accuracy using Confusion matrix
library(caret)
cm = confusionMatrix(table(test$Comm_teacher, fitted.results))

cm

fourfoldplot(cm$table)


#Make predictions on the future data
sample_data <- read.csv("Sample_Social_Data.csv")
sample_data <- sample_data[-7]

#leveling factor variables
levels(sample_data$Preferences) <- levels(train$Preferences)
levels(sample_data$Gender) <- levels(train$Gender)
levels(sample_data$mobile_phone) <- levels(train$mobile_phone)

#predicting record
my_prediction <- predict(fit, sample_data, type = "response")
#sample_data is contain record of for prediction which it doesnt contain Comm_teacher coloumn

# creating solution
my_solution <- data.frame(id = sample_data$Id, Comm_teacher = my_prediction)
#creating new dataframe on which id of sample record and predition of communication
#with teacher is stored of sample data, so to check output of sample data

#cheaking the result
table(my_solution$Comm_teacher)
##########################################################################################



#second Prediction of impact on their academic

set.seed(415)
library(randomForest)

#Training model with Random Forest
fit <- randomForest(as.factor(Academic_performance) ~ .,
                    data=train, importance=TRUE, ntree=100)

#Predict test data based on trained logistic model
fitted.results <- predict(fit,newdata=test)

#Evauate Model Accuracy using Confusion matrix
library(caret)
cm = confusionMatrix(table(test$Academic_performance, fitted.results))

cm

fourfoldplot(cm$table)



#Make predictions on the future data
sample_data <- read.csv("Sample_Social_Data.csv")
sample_data <- sample_data[-9]

#leveling factor variables
levels(sample_data$Preferences) <- levels(train$Preferences)
levels(sample_data$Gender) <- levels(train$Gender)
levels(sample_data$mobile_phone) <- levels(train$mobile_phone)

#predicting record
my_Prediction <- predict(fit, sample_data)
#sample_data is contain record of for prediction which it doesnt contain Academic_Performance coloumn

# creating solution
my_solution <- data.frame(id = sample_data$Id, Academic = my_Prediction)
#creating new dataframe on which id of sample record and predition of academic
#performance is stored of sample data, so to check output of sample data

#cheaking the result
table(my_solution$Academic)

##########################################################################################


#third Prediction of impact on their academic

set.seed(415)
library(randomForest)

#Training model with Random Forest
fit <- randomForest(as.factor(Influence_lifestyle) ~ .,
                    data=train, importance=TRUE, ntree=100)

#Predict test data based on trained logistic model
fitted.results <- predict(fit,newdata=test)

#Evauate Model Accuracy using Confusion matrix
library(caret)
cm = confusionMatrix(table(test$Influence_lifestyle, fitted.results))

cm

fourfoldplot(cm$table)


#Make predictions on the future data
sample_data <- read.csv("Sample_Social_Data.csv")
sample_data <- sample_data[-8]
  
#leveling factor variables
levels(sample_data$Preferences) <- levels(train$Preferences)
levels(sample_data$Gender) <- levels(train$Gender)
  levels(sample_data$mobile_phone) <- levels(train$mobile_phone)
  
#predicting record
my_prediction <- predict(fit, sample_data)
  
# creating solution
my_solution <- data.frame(id = sample_data$Id, Influence_lifestyle = my_prediction)
#creating new dataframe on which id of sample record and predition of influence
  #thier lifestyle is stored of sample data, so to check output of sample data
  
#cheaking the result
table(my_solution$Influence_lifestyle)

##########################################################################################

