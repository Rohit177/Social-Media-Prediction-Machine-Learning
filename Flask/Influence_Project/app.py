import numpy as np
from flask import Flask, request, jsonify, render_template
import pickle

app = Flask(__name__)
model = pickle.load(open('model.pkl', 'rb'))

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict',methods=['POST'])
def predict():
    '''
    For rendering results on HTML GUI
    '''
    age = request.form["Age"]
    gender = request.form["Gender"]
    preference = request.form["Preference"]
    mobile = request.form["Mobile"]
    hour = request.form["Hours"]
    teacher = request.form["Comm_Teacher"]

    int_features = [int(gender),int(age),int(preference),int(mobile),int(hour),int(teacher)]

    #int_features = [int(x) for x in range(6)]
    final_features = [np.array(int_features)]
    prediction = model.predict(final_features)
    print(prediction)
    output = round(prediction[0],2)
    
    return render_template('index.html', prediction_text='Influence Lifestyle {}'.format(output))


if __name__ == "__main__":
    app.run(debug=True)