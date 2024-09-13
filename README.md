# Social Media Prediction with Machine Learning

## Overview

This project aims to develop a machine learning model for predicting social media impact over students life. The system leverages a combination of Python, R programming, Flask, and custom datasets collected via Google Forms from students. 

## Technologies Used

- **Python**: For data processing, machine learning model development, and prediction.
- **R Programming**: For data processing, machine learning model development, and prediction.
- **Flask**: To create a web application that serves the machine learning model and provides a user interface.
- **Google Forms**: To collect custom datasets from student responses.

## Project Structure

```
social-media-prediction/
│
├── data/
│   ├── raw/                # Raw data collected from Google Forms
│   └── processed/          # Processed data ready for analysis
│
├── notebooks/              # Jupyter notebooks for exploratory data analysis and model building
│
├── src/
│   ├── __init__.py         # Initialization file for the src module
│   ├── data_preprocessing.py  # Scripts for cleaning and preparing data
│   ├── feature_engineering.py  # Scripts for feature extraction and transformation
│   ├── model_training.py    # Scripts for training machine learning models
│   └── model_evaluation.py  # Scripts for evaluating model performance
│
├── app/
│   ├── __init__.py         # Initialization file for the Flask app
│   ├── routes.py           # Define routes for the Flask web application
│   ├── static/             # Static files (CSS, JavaScript, images)
│   └── templates/          # HTML templates for the web application
│
├── requirements.txt        # Python dependencies
├── R_requirements.txt      # R dependencies
├── README.md               # This README file
└── .gitignore              # Git ignore file
```

## Setup

### Python Environment

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/social-media-prediction.git
   cd social-media-prediction
   ```

2. **Create a virtual environment and activate it:**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. **Install Python dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

### R Environment

1. **Install R and RStudio if not already installed.**

2. **Install R dependencies:**
   ```R
   install.packages(c('tidyverse', 'caret', 'shiny'))
   ```

## Usage

### Data Collection

1. **Google Forms:** The data is collected using Google Forms, with responses saved in CSV format. Place the CSV files in the `data/raw/` directory.

### Data Processing

1. **Preprocess Data:** Run the data preprocessing script to clean and prepare data.
   ```bash
   python src/data_preprocessing.py
   ```

2. **Feature Engineering:** Extract and transform features as needed.
   ```bash
   python src/feature_engineering.py
   ```

### Model Training and Evaluation

1. **Train Models:** Train your machine learning models using the training script.
   ```bash
   python src/model_training.py
   ```

2. **Evaluate Models:** Evaluate the performance of your models.
   ```bash
   python src/model_evaluation.py
   ```

### Web Application

1. **Run Flask App:** Start the Flask web application.
   ```bash
   python app/__init__.py
   ```

2. **Access the Application:** Open your web browser and go to `http://127.0.0.1:5000/` to interact with the application.

## Contributing

Feel free to submit issues and pull requests. For detailed instructions on how to contribute, please refer to the `CONTRIBUTING.md` file.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For any questions or feedback, please contact [your.email@example.com](mailto:your.email@example.com).

---

Thank you for checking out the Social Media Prediction project!
