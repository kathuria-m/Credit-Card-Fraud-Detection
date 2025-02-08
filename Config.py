import os

class Config:
    # PostgreSQL Database Configuration
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_PORT = os.getenv('DB_PORT', '5432')
    DB_NAME = os.getenv('DB_NAME', 'fraud_detection_db')
    DB_USER = os.getenv('DB_USER', 'postgres')
    DB_PASSWORD = os.getenv('DB_PASSWORD', 'your_password_here') 
    DATA_PATH = os.getenv('DATA_PATH', './data/creditcard.csv')  
    MODEL_SAVE_PATH = os.getenv('MODEL_SAVE_PATH', './models/fraud_detection_model.pkl')  
    PLOTS_PATH = os.getenv('PLOTS_PATH', './results/plots/')  
    RANDOM_STATE = int(os.getenv('RANDOM_STATE', 42))
    TEST_SIZE = float(os.getenv('TEST_SIZE', 0.2))  
    N_ESTIMATORS = int(os.getenv('N_ESTIMATORS', 100))  
    LOGISTIC_REG_PARAMS = {
        'max_iter': int(os.getenv('LOG_MAX_ITER', 1000)),
        'class_weight': os.getenv('LOG_CLASS_WEIGHT', 'balanced')
    }

    SVM_PARAMS = {
        'kernel': os.getenv('SVM_KERNEL', 'rbf'),
        'class_weight': os.getenv('SVM_CLASS_WEIGHT', 'balanced'),
        'probability': True,
        'random_state': RANDOM_STATE
    }

    RANDOM_FOREST_PARAMS = {
        'n_estimators': N_ESTIMATORS,
        'random_state': RANDOM_STATE,
        'class_weight': os.getenv('RF_CLASS_WEIGHT', 'balanced')
    }

]    PLOT_STYLE = os.getenv('PLOT_STYLE', 'seaborn-darkgrid')  
