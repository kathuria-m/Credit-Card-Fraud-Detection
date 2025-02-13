{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "-- Create the database\n",
    "CREATE DATABASE fraud_detection_db;\n",
    "\n",
    "-- Connect to the database\n",
    "\\c fraud_detection_db;\n",
    "\n",
    "-- Create the transactions table\n",
    "CREATE TABLE transactions (\n",
    "    time DOUBLE PRECISION,\n",
    "    v1 DOUBLE PRECISION,\n",
    "    v2 DOUBLE PRECISION,\n",
    "    v3 DOUBLE PRECISION,\n",
    "    v4 DOUBLE PRECISION,\n",
    "    v5 DOUBLE PRECISION,\n",
    "    v6 DOUBLE PRECISION,\n",
    "    v7 DOUBLE PRECISION,\n",
    "    v8 DOUBLE PRECISION,\n",
    "    v9 DOUBLE PRECISION,\n",
    "    v10 DOUBLE PRECISION,\n",
    "    v11 DOUBLE PRECISION,\n",
    "    v12 DOUBLE PRECISION,\n",
    "    v13 DOUBLE PRECISION,\n",
    "    v14 DOUBLE PRECISION,\n",
    "    v15 DOUBLE PRECISION,\n",
    "    v16 DOUBLE PRECISION,\n",
    "    v17 DOUBLE PRECISION,\n",
    "    v18 DOUBLE PRECISION,\n",
    "    v19 DOUBLE PRECISION,\n",
    "    v20 DOUBLE PRECISION,\n",
    "    v21 DOUBLE PRECISION,\n",
    "    v22 DOUBLE PRECISION,\n",
    "    v23 DOUBLE PRECISION,\n",
    "    v24 DOUBLE PRECISION,\n",
    "    v25 DOUBLE PRECISION,\n",
    "    v26 DOUBLE PRECISION,\n",
    "    v27 DOUBLE PRECISION,\n",
    "    v28 DOUBLE PRECISION,\n",
    "    amount DOUBLE PRECISION,\n",
    "    class INTEGER\n",
    ");\n",
    "\n",
    "-- Import data into the transactions table (adjust file path accordingly)\n",
    "-- \\\\COPY transactions FROM 'path/to/creditcard.csv' DELIMITER ',' CSV HEADER;\n",
    "\n",
    "-- Query: Total transactions and fraud distribution\n",
    "SELECT \n",
    "    COUNT(*) AS total_transactions,\n",
    "    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraudulent_transactions,\n",
    "    SUM(CASE WHEN class = 0 THEN 1 ELSE 0 END) AS non_fraudulent_transactions\n",
    "FROM transactions;\n",
    "\n",
    "-- Query: Fraudulent transactions by hour of day\n",
    "SELECT\n",
    "    (FLOOR(time / 3600)::INT % 24) AS hour_of_day,\n",
    "    COUNT(*) AS total_transactions,\n",
    "    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraudulent_transactions\n",
    "FROM transactions\n",
    "GROUP BY hour_of_day\n",
    "ORDER BY fraudulent_transactions DESC;\n",
    "\n",
    "-- Query: Categorize transactions based on amount\n",
    "SELECT \n",
    "    CASE \n",
    "        WHEN amount <= 50 THEN 'Small'\n",
    "        WHEN amount > 50 AND amount <= 200 THEN 'Medium'\n",
    "        WHEN amount > 200 AND amount <= 1000 THEN 'Large'\n",
    "        ELSE 'Very Large'\n",
    "    END AS amount_category,\n",
    "    COUNT(*) AS total_transactions,\n",
    "    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraudulent_transactions\n",
    "FROM transactions\n",
    "GROUP BY amount_category\n",
    "ORDER BY fraudulent_transactions DESC;\n",
    "\n",
    "-- Query: High-risk hours with most fraud\n",
    "SELECT \n",
    "    (FLOOR(time / 3600)::INT % 24) AS hour_of_day,\n",
    "    COUNT(*) AS total_transactions,\n",
    "    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraudulent_transactions,\n",
    "    ROUND((SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS fraud_percentage\n",
    "FROM transactions\n",
    "GROUP BY hour_of_day\n",
    "HAVING SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) > 0\n",
    "ORDER BY fraud_percentage DESC;\n",
    "\n",
    "-- Query: Average transaction amount for fraudulent vs non-fraudulent\n",
    "SELECT \n",
    "    class,\n",
    "    ROUND(AVG(amount), 2) AS avg_transaction_amount,\n",
    "    COUNT(*) AS total_transactions\n",
    "FROM transactions\n",
    "GROUP BY class;\n",
    "\n",
    "-- Query: Detect rapid transactions (possible fraud)\n",
    "SELECT \n",
    "    time,\n",
    "    amount,\n",
    "    class,\n",
    "    LEAD(time) OVER (ORDER BY time) - time AS time_diff\n",
    "FROM transactions\n",
    "WHERE class = 1\n",
    "ORDER BY time_diff ASC\n",
    "LIMIT 10;\n"
   ]
  }
 ],
 "metadata": {
  "language_info": {
   "name": "python"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
