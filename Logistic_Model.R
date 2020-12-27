#import dataset
dataset <- read.csv("Social_Data.csv")

View(dataset)

head(dataset)
tail(dataset)

names(dataset)

str(dataset)

summary(dataset)

#####################################################################################
#record visulization 
library(ggplot2)	#package for visualization functions

#categorical variables
ggplot(dataset, aes(x=Gender)) + geom_bar()	# visualize Gender
ggplot(dataset, aes(x=Age)) + geom_bar()		# visualize Age
ggplot(dataset, aes(x=Preferences)) + geom_bar()	# visualize Social Media Preference
ggplot(dataset, aes(x=mobile_phone)) + geom_bar()	# visualize having Mobile Phone
ggplot(dataset, aes(x=Hours)) + geom_bar()		# visualize time spend on Social Media

ggplot(dataset, aes(x=Preferences, fill=Gender)) + geom_bar()+
  theme_bw() +
  geom_bar() +
  labs(y = "Number Of Record", title = "Social Media Preference by gender") 	# visualize 
#Social Media usage as per gender

xtabs(~factor(Comm_teacher)+Hours+Gender,train)
ggplot(dataset) + geom_bar(aes(x=Gender, fill=factor(Comm_teacher))) + facet_grid(Hours ~ .) 
# visualize individual hours in which how many students are communicate with teachers and 
#visualize there gender as well


#####################################################################################
set.seed(50)  #seting seed to get same result during multiple execution run

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

#Training model with logistics regression
logit_model1 <- glm(Academic_performance ~ Gender + Age + Preferences + mobile_phone + Hours + Comm_teacher , family=binomial, data = train)
summary(logit_model1)

#Predict test data based on trained logistic model
fitted.results <- predict(logit_model1, newdata=test[1:7], type='response')

# If prob > 0.5 then 1, else 0.
fitted.results <- ifelse(fitted.results > 0.5,1,0)

#Model Accuracy
library(caret)
cm = confusionMatrix(table(test$Academic_performance, fitted.results))

cm

fourfoldplot(cm$table)


#Make predictions on the future data
sample_data <- read.csv("Sample_Social_Data.csv")
sample_data <- sample_data[1:7]

my_prediction <- predict(logit_model1, sample_data, type = "response") 
#sample_data is contain record of for prediction which it doesnt contain Academic_Performance coloumn
my_prediction <- ifelse(my_prediction > 0.5,1,0)

# creating solution
my_solution <- data.frame(id = sample_data$Id, Academic_performance = my_prediction)
#creating new dataframe on which id of sample record and predition of academic
#performance is stored of sample data, so to check output of sample data

nrow(my_solution)
str(my_solution)

#future data result
table(my_solution$Academic_performance)

##########################################################################################


#Second Prediction of impact on their personal life

#Training model with logistics regression
logit_model2 <- glm(Influence_lifestyle ~ Gender + Age + Preferences + mobile_phone + Hours + Comm_teacher  ,family=binomial, data = train)
summary(logit_model2)

#Predict test data based on trained logistic model
fitted.results <- predict(logit_model2,newdata=test[1:7],type='response')

#Change probabilities to class (0 or 1/Yes or No), If prob > 0.5 then 1, else 0.
fitted.results <- ifelse(fitted.results > 0.5,1,0)

#Evauate Model Accuracy using Confusion matrix
library(caret)
cm = confusionMatrix(table(test$Influence_lifestyle, fitted.results))

cm

fourfoldplot(cm$table)

#Make predictions on the future data
sample_data <- read.csv("Sample_Social_Data.csv")
sample_data <- sample_data[1:7]

my_prediction <- predict(logit_model2, sample_data, type = "response") 
#sample_data is contain record of for prediction which it doesnt contain influence lifestyle coloumn
my_prediction <- ifelse(my_prediction > 0.5,1,0)

# creating solution
my_solution <- data.frame(id = sample_data$Id, Influence_lifestyle = my_prediction)
#creating new dataframe on which id of sample record and predition of infleunce
#lifestyle is stored of sample data, so to check output of sample data

nrow(my_solution)
str(my_solution)

#future data result
table(my_solution$Influence_lifestyle)


