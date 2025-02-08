# credit-card-Fraud-Detection

Overview

This project focuses on building a robust fraud detection system using a combination of SQL and machine learning techniques. The primary goal is to identify fraudulent credit card transactions from a highly imbalanced dataset. The project demonstrates how real-world data pipelines integrate databases and machine learning models for effective fraud detection.

Dataset

Source: Kaggle Credit Card Fraud Detection Dataset

Description: This dataset contains transactions made by credit cards in September 2013 by European cardholders. It presents transactions that occurred over two days, with 492 fraudulent transactions out of 284,807 total transactions.

Features:

Time: Seconds elapsed between each transaction and the first transaction.

V1 to V28: Anonymized features resulting from PCA transformation.

Amount: Transaction amount.

Class: Target variable (0 for non-fraudulent, 1 for fraudulent).

Technologies Used

PostgreSQL: For database management and querying.

Python (Pandas, Scikit-learn, Seaborn, Matplotlib): For data analysis, visualization, and machine learning modeling.

Jupyter Notebook: For interactive development and analysis.

Steps and Methodology

1. Data Loading and Database Integration

Created a PostgreSQL database and imported the dataset into a transactions table.

Used SQL queries to explore and preprocess the data directly from the database.

2. Exploratory Data Analysis (EDA)

Analyzed the distribution of fraudulent vs. non-fraudulent transactions.

Identified key patterns like transaction time and amount contributing to fraud.

3. Feature Engineering

Derived features such as hour_of_day and categorized transactions by amount.

Standardized numerical features for better model performance.

4. Machine Learning Models

Implemented and compared multiple machine learning models:

Random Forest Classifier

Logistic Regression

Support Vector Machine (SVM)

5. Model Evaluation

AUPRC (Area Under Precision-Recall Curve): Achieved an AUPRC of 0.87, indicating excellent model performance on this imbalanced dataset.

ROC-AUC Score: Compared ROC curves across models.

Precision and Recall: Focused on minimizing false positives and false negatives.

6. Categorization of Fraudulent Transactions

Categorized fraud based on:

Time of Day: Identified peak fraud hours.

Transaction Amount: Detected high-risk transactions based on value.

Behavioral Patterns: Used clustering techniques to detect unusual behavior.

Key Results

AUPRC Score: 0.87 (indicating robust performance on imbalanced data).

High-risk Hours: Most fraud occurred during off-peak hours (midnight to 4 AM).

Fraud Categories: High-value transactions and rapid multiple transactions flagged as potential fraud.

How to Run the Project

1. Clone the Repository

git clone https://github.com/yourusername/fraud_detection_project.git
cd fraud_detection_project

2. Set Up PostgreSQL Database

Create a database named fraud_detection_db.

Run the SQL script to create tables and import data:

\i scripts/fraud_detection.sql

3. Run Jupyter Notebook

jupyter notebook notebooks/fraud_detection_analysis.ipynb

4. Install Required Libraries

pip install -r requirements.txt

License

This project is licensed under the MIT License.

Contact

For any inquiries, reach out to muskaankathuria.n@gmail.com
