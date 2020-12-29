import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.preprocessing import LabelEncoder
import pickle

#importing the dataset
dataset = pd.read_csv("Social_data_encode.csv")

X =dataset.drop(['Influence_lifestyle','Academic_performance'],axis=1)

y=dataset['Influence_lifestyle']

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size = 0.25, random_state = 0)

#fitting Logistic Regression model to the dataset
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(random_state = 0)
classifier.fit(X_train,y_train)

pickle.dump(classifier, open('model.pkl','wb'))

model = pickle.load(open('model.pkl','rb'))
print(model.predict([[1,118,5,1,1,1]]))

print(model.predict([[0,21,3,1,0,0]]))

print(model.predict([[0,21,2,1,1,0]]))
print(model.predict([[1,25,1,0,3,0]]))


print(model.predict([[0,24,5,1,1,0]]))

print(model.predict([[1,23,2,1,5,1]]))

print(model.predict([[0,21,5,0,4,1]]))

print(model.predict([[0,21,5,0,4,1]]))
print(model.predict([[0,24,1,0,2,0]]))