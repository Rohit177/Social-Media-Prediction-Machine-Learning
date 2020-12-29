#import dataset
dataset <- read.csv("Social_Data.csv")

View(dataset)

head(dataset)
tail(dataset)

names(dataset)

str(dataset)

summary(dataset)

#####################################################################################
set.seed(50)  #seting seed to get same result during multiple exaction run

#Split data in train and test data
library(caTools)

split <- sample.split(dataset, SplitRatio = 0.8)  #split data, 80% as train and 20% as test
split

train<- subset(dataset, split == "TRUE")
test<- subset(dataset, split == "FALSE")

str(train)
str(test)
##########################################################################################


#First Prediction of impact on their academic
set.seed(415)
library(randomForest)

#Training model with Random Forest
fit <- randomForest(as.factor(Academic_performance) ~ Gender + Age + Preferences + mobile_phone + Hours + Comm_teacher ,
                    data=train, importance=TRUE, ntree=100)

#Predict test data based on trained logistic model
fitted.results <- predict(fit,newdata=test[1:7])

#Evauate Model Accuracy using Confusion matrix
library(caret)
cm = confusionMatrix(table(test$Academic_performance, fitted.results))

cm

fourfoldplot(cm$table)

#Make predictions on the future data
sample_data <- read.csv("Sample_Social_Data.csv")
sample_data <- sample_data[1:7]

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


#Second Prediction of impact on their academic

set.seed(415)
library(randomForest)

#Training model with Random Forest
fit <- randomForest(as.factor(Influence_lifestyle) ~ Gender + Age + Preferences + mobile_phone + Hours + Comm_teacher ,
                    data=train, importance=TRUE, ntree=100)

#Predict test data based on trained logistic model
fitted.results <- predict(fit,newdata=test[1:7])

#Evauate Model Accuracy using Confusion matrix
library(caret)
cm = confusionMatrix(table(test$Influence_lifestyle, fitted.results))

cm

fourfoldplot(cm$table)


#Make predictions on the future data
sample_data <- read.csv("Sample_Social_Data.csv")
sample_data <- sample_data[1:7]

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

