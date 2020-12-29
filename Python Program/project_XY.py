#Logistic Regression

#import library
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.preprocessing import LabelEncoder

#importing the dataset
dataset = pd.read_csv("Social_Data.csv")

encoder=LabelEncoder()
dataset.Preferences=encoder.fit_transform(dataset.Preferences)
dataset.Gender=encoder.fit_transform(dataset.Gender)
dataset.mobile_phone=encoder.fit_transform(dataset.mobile_phone)

dataset.head()

###########################################################################
#first predction of social media for Academic Performance

X=dataset.drop(['Influence_lifestyle','Academic_performance'],axis=1)
y=dataset['Academic_performance']

#split data into train and test
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size = 0.25, random_state = 0)


#fitting Logistic Regression model to the dataset
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(random_state = 0)
classifier.fit(X_train,y_train)

#Predicting the Test set results
y_pred = classifier.predict(X_test)

#making the confusion matrix
from sklearn.metrics import confusion_matrix, accuracy_score
cm = confusion_matrix(y_test, y_pred)
accuracy_score(y_test, y_pred)
cm

#predicting sample data of 80 students
sample = pd.read_csv("Sample_Social_Data.csv")

encoder=LabelEncoder()
sample.Preferences=encoder.fit_transform(sample.Preferences)
sample.Gender=encoder.fit_transform(sample.Gender)
sample.mobile_phone=encoder.fit_transform(sample.mobile_phone)

sample_X = sample.drop(['Influence_lifestyle','Academic_performance'],axis=1)

s_pred = classifier.predict(sample_X)

data = { 'Id' : [sample['Id']], 
        'Academic_performance' : [s_pred]
        }

my_solution = pd.DataFrame(data)
my_solution.sum(axis=1)

my_solution['Academic_performance'].apply(pd.value_counts)

###########################################################################

#model 2
#second predction of social media impacted on their personal life

y=dataset['Influence_lifestyle']

#split data into train and test
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size = 0.25, random_state = 0)

#feature scalling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
#sc_y = StandardScaler()
#y_train = sc_y.fit_transform(y_train)

#fitting Logistic Regression model to the dataset
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(random_state = 0)
classifier.fit(X_train,y_train)

#Predicting the Test set results
y_pred = classifier.predict(X_test)

#making the confusion matrix
from sklearn.metrics import confusion_matrix, accuracy_score
cm = confusion_matrix(y_test, y_pred)
accuracy_score(y_test, y_pred)
cm

#predicting sample data of 80 students
sample = pd.read_csv("Sample_Social_Data.csv")

encoder=LabelEncoder()
sample.Preferences=encoder.fit_transform(sample.Preferences)
sample.Gender=encoder.fit_transform(sample.Gender)
sample.mobile_phone=encoder.fit_transform(sample.mobile_phone)

sample_X = sample.drop(['Influence_lifestyle','Academic_performance'],axis=1)
sample_y=sample['Influence_lifestyle']

s_pred = classifier.predict(sample_X)

data = { 'Id' : [sample['Id']], 
        'Influence_lifestyle' : [s_pred]
        }

my_solution = pd.DataFrame(data)
my_solution.sum(axis=1)

my_solution['Influence_lifestyle'].apply(pd.value_counts)

