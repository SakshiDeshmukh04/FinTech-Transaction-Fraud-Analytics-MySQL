CREATE DATABASE
fintech_fraud_analytics;
USE fintech_fraud_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    signup_date date
);


CREATE TABLE merchants (
    merchant_id INT PRIMARY KEY,
    merchant_name VARCHAR(100),
    merchant_category VARCHAR(50),
    city VARCHAR(50),
    risk_level VARCHAR(20)
);


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    merchant_id INT,
    transaction_date DATETIME,
    transaction_amount DECIMAL(12,2),
    transaction_type VARCHAR(30),
    transaction_status VARCHAR(20),
    payment_channel VARCHAR(30),
    location_id INT,
    is_fraud BOOLEAN,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)
);

   
   CREATE TABLE payment_methods (
    payment_method_id INT PRIMARY KEY,
    account_id INT,
    payment_method VARCHAR(30),
    card_network VARCHAR(30),
    masked_account VARCHAR(30),
    is_active BOOLEAN,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);


CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    risk_zone VARCHAR(20)
);


CREATE TABLE fraud_alerts (
    alert_id INT PRIMARY KEY,
    transaction_id INT,
    alert_date DATETIME,
    alert_type VARCHAR(50),
    alert_severity VARCHAR(20),
    alert_status VARCHAR(20),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);



SHOW TABLES;


INSERT INTO customers
(customer_id, customer_name, age, gender, city, signup_date)
VALUES
(101, 'Aarav Sharma', 28, 'Male', 'Pune', '2024-01-15'),
(102, 'Isha Patil', 24, 'Female', 'Mumbai', '2024-02-10'),
(103, 'Rohan Mehta', 32, 'Male', 'Delhi', '2024-02-18'),
(104, 'Sneha Joshi', 27, 'Female', 'Bengaluru', '2024-03-05'),
(105, 'Aditya Kulkarni', 35, 'Male', 'Pune', '2024-03-22'),
(106, 'Neha Shah', 29, 'Female', 'Ahmedabad', '2024-04-11'),
(107, 'Vikram Singh', 41, 'Male', 'Delhi', '2024-04-25'),
(108, 'Priya Nair', 26, 'Female', 'Kochi', '2024-05-08'),
(109, 'Karan Desai', 33, 'Male', 'Mumbai', '2024-05-19'),
(110, 'Ananya Rao', 23, 'Female', 'Bengaluru', '2024-06-03'),
(111, 'Rahul Verma', 38, 'Male', 'Jaipur', '2024-06-17'),
(112, 'Meera Kapoor', 31, 'Female', 'Delhi', '2024-07-01'),
(113, 'Siddharth Jain', 30, 'Male', 'Pune', '2024-07-14'),
(114, 'Kavya Iyer', 25, 'Female', 'Chennai', '2024-08-06'),
(115, 'Manish Gupta', 44, 'Male', 'Lucknow', '2024-08-21'),
(116, 'Pooja Malhotra', 29, 'Female', 'Mumbai', '2024-09-09'),
(117, 'Nikhil Bansal', 36, 'Male', 'Chandigarh', '2024-09-25'),
(118, 'Riya Mishra', 22, 'Female', 'Jaipur', '2024-10-12'),
(119, 'Arjun Sethi', 34, 'Male', 'Delhi', '2024-11-04'),
(120, 'Tanvi More', 27, 'Female', 'Pune', '2024-12-18');


SELECT * FROM customers;


INSERT INTO accounts
(account_id, customer_id, account_type, account_status, opening_date, account_balance)
VALUES
(2001, 101, 'Savings', 'Active', '2024-01-15', 85000.00),
(2002, 102, 'Savings', 'Active', '2024-02-10', 42000.50),
(2003, 103, 'Current', 'Active', '2024-02-18', 125000.00),
(2004, 104, 'Savings', 'Active', '2024-03-05', 67500.75),
(2005, 105, 'Savings', 'Active', '2024-03-22', 98000.00),
(2006, 106, 'Savings', 'Active', '2024-04-11', 54000.25),
(2007, 107, 'Current', 'Active', '2024-04-25', 210000.00),
(2008, 108, 'Savings', 'Active', '2024-05-08', 36000.00),
(2009, 109, 'Savings', 'Inactive', '2024-05-19', 12000.50),
(2010, 110, 'Savings', 'Active', '2024-06-03', 73500.00),
(2011, 111, 'Current', 'Active', '2024-06-17', 156000.00),
(2012, 112, 'Savings', 'Active', '2024-07-01', 62000.00),
(2013, 113, 'Savings', 'Active', '2024-07-14', 91000.00),
(2014, 114, 'Savings', 'Active', '2024-08-06', 48500.00),
(2015, 115, 'Current', 'Active', '2024-08-21', 178000.00),
(2016, 116, 'Savings', 'Active', '2024-09-09', 57000.00),
(2017, 117, 'Savings', 'Active', '2024-09-25', 83000.00),
(2018, 118, 'Savings', 'Active', '2024-10-12', 29500.00),
(2019, 119, 'Current', 'Active', '2024-11-04', 143000.00),
(2020, 120, 'Savings', 'Active', '2024-12-18', 69000.00);

SELECT * FROM accounts;


INSERT INTO merchants
(merchant_id, merchant_name, merchant_category, city, risk_level)
VALUES
(301, 'TechZone Electronics', 'Electronics', 'Pune', 'Medium'),
(302, 'FreshMart Superstore', 'Grocery', 'Mumbai', 'Low'),
(303, 'QuickBite Foods', 'Food', 'Delhi', 'Low'),
(304, 'StyleStreet Fashion', 'Fashion', 'Bengaluru', 'Medium'),
(305, 'TravelGo', 'Travel', 'Pune', 'High'),
(306, 'MediCare Pharmacy', 'Healthcare', 'Ahmedabad', 'Low'),
(307, 'GameWorld Online', 'Gaming', 'Delhi', 'High'),
(308, 'HomeNeeds', 'Home & Furniture', 'Mumbai', 'Medium'),
(309, 'BookNest', 'Books', 'Pune', 'Low'),
(310, 'LuxuryHub', 'Luxury', 'Bengaluru', 'High'),
(311, 'FoodExpress', 'Food', 'Chennai', 'Low'),
(312, 'AutoParts Pro', 'Automotive', 'Delhi', 'Medium'),
(313, 'DigitalWorld', 'Electronics', 'Mumbai', 'Medium'),
(314, 'FashionKart', 'Fashion', 'Jaipur', 'Medium'),
(315, 'CloudServices Plus', 'Technology', 'Pune', 'High');


SELECT * FROM merchants;


INSERT INTO locations
(location_id, city, state, country, risk_zone)
VALUES
(401, 'Pune', 'Maharashtra', 'India', 'Low'),
(402, 'Mumbai', 'Maharashtra', 'India', 'Medium'),
(403, 'Delhi', 'Delhi', 'India', 'High'),
(404, 'Bengaluru', 'Karnataka', 'India', 'Medium'),
(405, 'Ahmedabad', 'Gujarat', 'India', 'Low'),
(406, 'Chennai', 'Tamil Nadu', 'India', 'Low'),
(407, 'Jaipur', 'Rajasthan', 'India', 'Medium'),
(408, 'Kolkata', 'West Bengal', 'India', 'Medium'),
(409, 'Hyderabad', 'Telangana', 'India', 'Low'),
(410, 'Lucknow', 'Uttar Pradesh', 'India', 'High'),
(411, 'Chandigarh', 'Chandigarh', 'India', 'Low'),
(412, 'Nagpur', 'Maharashtra', 'India', 'Medium');


SELECT * FROM locations;


INSERT INTO transactions
(transaction_id, account_id, merchant_id, transaction_date,
 transaction_amount, transaction_type, transaction_status,
 payment_channel, location_id, is_fraud)
VALUES
(5001, 2001, 301, '2025-01-05 10:15:00', 45000.00, 'Purchase', 'Successful', 'Credit Card', 401, FALSE),
(5002, 2002, 302, '2025-01-06 14:20:00', 3200.50, 'Purchase', 'Successful', 'UPI', 402, FALSE),
(5003, 2003, 303, '2025-01-07 19:45:00', 850.00, 'Purchase', 'Successful', 'UPI', 403, FALSE),
(5004, 2004, 304, '2025-01-08 11:30:00', 5600.00, 'Purchase', 'Successful', 'Debit Card', 404, FALSE),
(5005, 2005, 305, '2025-01-09 02:15:00', 125000.00, 'Purchase', 'Successful', 'Credit Card', 403, TRUE),
(5006, 2006, 306, '2025-01-10 09:10:00', 1850.00, 'Purchase', 'Successful', 'UPI', 405, FALSE),
(5007, 2007, 307, '2025-01-11 01:45:00', 78000.00, 'Purchase', 'Successful', 'Credit Card', 403, TRUE),
(5008, 2008, 308, '2025-01-12 16:25:00', 9200.00, 'Purchase', 'Successful', 'Debit Card', 402, FALSE),
(5009, 2009, 309, '2025-01-13 12:40:00', 650.00, 'Purchase', 'Successful', 'UPI', 401, FALSE),
(5010, 2010, 310, '2025-01-14 03:10:00', 95000.00, 'Purchase', 'Failed', 'Credit Card', 404, TRUE),

(5011, 2011, 311, '2025-01-15 20:15:00', 1250.00, 'Purchase', 'Successful', 'UPI', 406, FALSE),
(5012, 2012, 312, '2025-01-16 13:35:00', 18500.00, 'Purchase', 'Successful', 'Debit Card', 403, FALSE),
(5013, 2013, 313, '2025-01-17 15:20:00', 42000.00, 'Purchase', 'Successful', 'Credit Card', 402, FALSE),
(5014, 2014, 314, '2025-01-18 18:05:00', 7600.00, 'Purchase', 'Successful', 'UPI', 407, FALSE),
(5015, 2015, 315, '2025-01-19 02:35:00', 150000.00, 'Purchase', 'Successful', 'Credit Card', 410, TRUE),
(5016, 2016, 301, '2025-01-20 10:50:00', 22500.00, 'Purchase', 'Successful', 'Debit Card', 401, FALSE),
(5017, 2017, 302, '2025-01-21 17:40:00', 4100.00, 'Purchase', 'Successful', 'UPI', 411, FALSE),
(5018, 2018, 303, '2025-01-22 21:10:00', 980.00, 'Purchase', 'Successful', 'UPI', 407, FALSE),
(5019, 2019, 304, '2025-01-23 12:25:00', 6300.00, 'Purchase', 'Successful', 'Debit Card', 403, FALSE),
(5020, 2020, 305, '2025-01-24 00:40:00', 115000.00, 'Purchase', 'Successful', 'Credit Card', 403, TRUE),

(5021, 2001, 307, '2025-01-25 23:55:00', 67000.00, 'Purchase', 'Successful', 'Credit Card', 403, TRUE),
(5022, 2002, 308, '2025-01-26 09:35:00', 5400.00, 'Purchase', 'Successful', 'UPI', 402, FALSE),
(5023, 2003, 309, '2025-01-27 14:45:00', 890.00, 'Purchase', 'Successful', 'UPI', 401, FALSE),
(5024, 2004, 310, '2025-01-28 02:20:00', 88000.00, 'Purchase', 'Successful', 'Credit Card', 404, TRUE),
(5025, 2005, 311, '2025-01-29 19:30:00', 1450.00, 'Purchase', 'Successful', 'UPI', 406, FALSE),
(5026, 2006, 312, '2025-01-30 11:15:00', 22000.00, 'Purchase', 'Successful', 'Debit Card', 405, FALSE),
(5027, 2007, 313, '2025-02-01 16:40:00', 37500.00, 'Purchase', 'Successful', 'Credit Card', 402, FALSE),
(5028, 2008, 314, '2025-02-02 18:55:00', 6800.00, 'Purchase', 'Successful', 'UPI', 407, FALSE),
(5029, 2009, 315, '2025-02-03 01:25:00', 135000.00, 'Purchase', 'Successful', 'Credit Card', 410, TRUE),
(5030, 2010, 301, '2025-02-04 10:05:00', 18500.00, 'Purchase', 'Successful', 'Debit Card', 401, FALSE);


SELECT * FROM transactions;



INSERT INTO payment_methods
(payment_method_id, account_id, payment_method, card_network, masked_account, is_active)
VALUES
(6001, 2001, 'Credit Card', 'Visa', 'XXXX-4521', TRUE),
(6002, 2002, 'UPI', NULL, 'isha@upi', TRUE),
(6003, 2003, 'Debit Card', 'RuPay', 'XXXX-7834', TRUE),
(6004, 2004, 'UPI', NULL, 'sneha@upi', TRUE),
(6005, 2005, 'Credit Card', 'Mastercard', 'XXXX-2198', TRUE),
(6006, 2006, 'UPI', NULL, 'neha@upi', TRUE),
(6007, 2007, 'Credit Card', 'Visa', 'XXXX-6742', TRUE),
(6008, 2008, 'Debit Card', 'RuPay', 'XXXX-3389', TRUE),
(6009, 2009, 'UPI', NULL, 'karan@upi', FALSE),
(6010, 2010, 'Credit Card', 'Mastercard', 'XXXX-9056', TRUE),
(6011, 2011, 'UPI', NULL, 'rahul@upi', TRUE),
(6012, 2012, 'Debit Card', 'Visa', 'XXXX-5612', TRUE),
(6013, 2013, 'Credit Card', 'Visa', 'XXXX-8475', TRUE),
(6014, 2014, 'UPI', NULL, 'kavya@upi', TRUE),
(6015, 2015, 'Credit Card', 'Mastercard', 'XXXX-1943', TRUE),
(6016, 2016, 'Debit Card', 'RuPay', 'XXXX-6721', TRUE),
(6017, 2017, 'UPI', NULL, 'nikhil@upi', TRUE),
(6018, 2018, 'UPI', NULL, 'riya@upi', TRUE),
(6019, 2019, 'Credit Card', 'Visa', 'XXXX-3256', TRUE),
(6020, 2020, 'Debit Card', 'RuPay', 'XXXX-7810', TRUE);


SELECT * FROM payment_methods;


INSERT INTO fraud_alerts
(alert_id, transaction_id, alert_date, alert_type, alert_severity, alert_status)
VALUES
(7001, 5005, '2025-01-09 02:20:00', 'High Value Transaction', 'High', 'Open'),
(7002, 5007, '2025-01-11 01:50:00', 'Unusual Night Transaction', 'High', 'Investigating'),
(7003, 5010, '2025-01-14 03:15:00', 'Failed High Value Transaction', 'High', 'Resolved'),
(7004, 5015, '2025-01-19 02:40:00', 'High Risk Location', 'Critical', 'Investigating'),
(7005, 5020, '2025-01-24 00:45:00', 'Unusual Night Transaction', 'High', 'Open'),
(7006, 5021, '2025-01-25 23:58:00', 'Suspicious Merchant Activity', 'Critical', 'Investigating'),
(7007, 5024, '2025-01-28 02:25:00', 'Unusual Night Transaction', 'High', 'Open'),
(7008, 5029, '2025-02-03 01:30:00', 'High Risk Location', 'Critical', 'Open');


SELECT * FROM fraud_alerts;


INSERT INTO chargebacks
(chargeback_id, transaction_id, chargeback_date, chargeback_reason, chargeback_amount, chargeback_status)
VALUES
(8001, 5005, '2025-01-15', 'Unauthorized Transaction', 125000.00, 'Approved'),
(8002, 5007, '2025-01-18', 'Cardholder Dispute', 78000.00, 'Approved'),
(8003, 5015, '2025-01-25', 'Unauthorized Transaction', 150000.00, 'Approved'),
(8004, 5020, '2025-01-30', 'Suspicious Transaction', 115000.00, 'Under Review'),
(8005, 5021, '2025-02-02', 'Unauthorized Transaction', 67000.00, 'Approved'),
(8006, 5024, '2025-02-05', 'Cardholder Dispute', 88000.00, 'Under Review'),
(8007, 5029, '2025-02-10', 'Unauthorized Transaction', 135000.00, 'Approved');


SELECT * FROM chargebacks;





-- Q1. How many total transactions has the fintech company processed?

SELECT COUNT(*) AS total_transactions
FROM transactions;


-- Q2. How many transactions were successful?

SELECT COUNT(*) AS successful_transactions
FROM transactions
WHERE transaction_status = 'Successful';


-- Q3. How many transactions failed?

SELECT COUNT(*) AS failed_transactions
FROM transactions
WHERE transaction_status = 'Failed';


-- Q4. What is the total transaction amount processed?

SELECT SUM(transaction_amount) AS total_transaction_value
FROM transactions;


-- Q5. What is the average transaction amount?

SELECT AVG(transaction_amount) AS average_transaction_amount
FROM transactions;


-- Q6. What is the highest-value transaction?

SELECT MAX(transaction_amount) AS highest_transaction_amount
FROM transactions;


-- Q7. Which customer made the highest-value transaction?

SELECT 
    c.customer_name,
    t.transaction_amount
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY t.transaction_amount DESC
LIMIT 1;


-- Q8. Which merchant received the highest-value transaction?

SELECT 
    m.merchant_name,
    t.transaction_amount
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
ORDER BY t.transaction_amount DESC
LIMIT 1;


-- Q9. Which payment channel has the highest number of transactions?

SELECT
    payment_channel,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY payment_channel
ORDER BY total_transactions DESC
LIMIT 1;


-- Q10. What is the total transaction value for each payment channel?

SELECT
    payment_channel,
    SUM(transaction_amount) AS total_transaction_value
FROM transactions
GROUP BY payment_channel
ORDER BY total_transaction_value DESC;



-- Q11. What is the average transaction amount for each payment channel?

SELECT
    payment_channel,
    AVG(transaction_amount) AS average_transaction_amount
FROM transactions
GROUP BY payment_channel
ORDER BY average_transaction_amount DESC;



-- Q12. How many fraudulent transactions are there?

SELECT
    COUNT(*) AS fraudulent_transactions
FROM transactions
WHERE is_fraud = TRUE;



-- Q13. What is the total value of fraudulent transactions?

SELECT
    SUM(transaction_amount) AS total_fraud_value
FROM transactions
WHERE is_fraud = TRUE;



-- Q14. What is the average value of fraudulent transactions?

SELECT
    AVG(transaction_amount) AS average_fraud_transaction_value
FROM transactions
WHERE is_fraud = TRUE;



-- Q15. How many fraudulent transactions occurred through each payment channel?

SELECT
    payment_channel,
    COUNT(*) AS fraudulent_transactions
FROM transactions
WHERE is_fraud = TRUE
GROUP BY payment_channel
ORDER BY fraudulent_transactions DESC;



-- Q16. What is the fraud rate for each payment channel?

SELECT
    payment_channel,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM transactions
GROUP BY payment_channel
ORDER BY fraud_rate_percentage DESC;



-- Q17. Which merchant has the highest number of fraud-marked transactions?

SELECT
    m.merchant_name,
    COUNT(*) AS fraudulent_transactions
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
WHERE t.is_fraud = TRUE
GROUP BY m.merchant_name
ORDER BY fraudulent_transactions DESC
LIMIT 1;



-- Q18. Show all merchants with their total transactions and fraud-marked transactions

SELECT
    m.merchant_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions
FROM merchants m
LEFT JOIN transactions t
    ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_name
ORDER BY fraudulent_transactions DESC;



-- Q19. Which cities have the highest number of fraud-marked transactions?

SELECT
    l.city,
    COUNT(*) AS fraudulent_transactions
FROM transactions t
JOIN locations l
    ON t.location_id = l.location_id
WHERE t.is_fraud = TRUE
GROUP BY l.city
ORDER BY fraudulent_transactions DESC;



-- Q20. What is the fraud rate for each city?

SELECT
    l.city,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM transactions t
JOIN locations l
    ON t.location_id = l.location_id
GROUP BY l.city
ORDER BY fraud_rate_percentage DESC;



-- Q21. What is the total transaction value by city?

SELECT
    l.city,
    SUM(t.transaction_amount) AS total_transaction_value
FROM transactions t
JOIN locations l
    ON t.location_id = l.location_id
GROUP BY l.city
ORDER BY total_transaction_value DESC;



-- Q22. Which transaction types are being used, and how many transactions are in each type?

SELECT
    transaction_type,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_type
ORDER BY total_transactions DESC;



-- Q23. What is the total transaction value by transaction status?

SELECT
    transaction_status,
    COUNT(*) AS total_transactions,
    SUM(transaction_amount) AS total_transaction_value
FROM transactions
GROUP BY transaction_status
ORDER BY total_transaction_value DESC;



-- Q24. What is the total value of fraud-marked transactions by payment channel?

SELECT
    payment_channel,
    COUNT(*) AS fraudulent_transactions,
    SUM(transaction_amount) AS total_fraud_value
FROM transactions
WHERE is_fraud = TRUE
GROUP BY payment_channel
ORDER BY total_fraud_value DESC;



-- Q25. How many fraud alerts were generated for each severity level?

SELECT
    alert_severity,
    COUNT(*) AS total_alerts
FROM fraud_alerts
GROUP BY alert_severity
ORDER BY total_alerts DESC;



-- Q26. What is the status of fraud alerts?

SELECT
    alert_status,
    COUNT(*) AS total_alerts
FROM fraud_alerts
GROUP BY alert_status
ORDER BY total_alerts DESC;



-- Q27. Which type of fraud alert occurs most frequently?

SELECT
    alert_type,
    COUNT(*) AS total_alerts
FROM fraud_alerts
GROUP BY alert_type
ORDER BY total_alerts DESC;



-- Q28. Which customers have fraud-marked transactions?

SELECT
    c.customer_name,
    COUNT(t.transaction_id) AS fraudulent_transactions,
    SUM(t.transaction_amount) AS total_fraud_value
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
WHERE t.is_fraud = TRUE
GROUP BY c.customer_name
ORDER BY total_fraud_value DESC;



-- Q29. Which account types have the most fraud-marked transactions?

SELECT
    a.account_type,
    COUNT(t.transaction_id) AS fraudulent_transactions,
    SUM(t.transaction_amount) AS total_fraud_value
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
WHERE t.is_fraud = TRUE
GROUP BY a.account_type
ORDER BY fraudulent_transactions DESC;



-- Q30. What is the fraud rate by account type?

SELECT
    a.account_type,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
GROUP BY a.account_type
ORDER BY fraud_rate_percentage DESC;



-- Q31. How many chargebacks have been recorded, and what is the total chargeback amount?

SELECT
    COUNT(*) AS total_chargebacks,
    SUM(chargeback_amount) AS total_chargeback_amount
FROM chargebacks;


-- Q32. What is the chargeback amount by chargeback status?

SELECT
    chargeback_status,
    COUNT(*) AS total_chargebacks,
    SUM(chargeback_amount) AS total_chargeback_amount
FROM chargebacks
GROUP BY chargeback_status
ORDER BY total_chargeback_amount DESC;



-- Q33. Which fraud-marked transactions resulted in chargebacks?

SELECT
    t.transaction_id,
    t.transaction_amount,
    c.chargeback_amount,
    c.chargeback_status
FROM transactions t
JOIN chargebacks c
    ON t.transaction_id = c.transaction_id
WHERE t.is_fraud = TRUE
ORDER BY t.transaction_amount DESC;



-- Q34. Which merchant categories have the most fraud-marked transactions?

SELECT
    m.merchant_category,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_category
ORDER BY fraudulent_transactions DESC;



-- Q35. How many fraud-marked transactions occurred during night hours?

SELECT
    CASE
        WHEN HOUR(transaction_date) >= 22
             OR HOUR(transaction_date) < 6
        THEN 'Night'
        ELSE 'Day'
    END AS time_period,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM transactions
GROUP BY time_period
ORDER BY fraud_rate_percentage DESC;



-- Q36. What is the fraud rate in high-risk locations?

SELECT
    l.risk_zone,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage
FROM transactions t
JOIN locations l
    ON t.location_id = l.location_id
GROUP BY l.risk_zone
ORDER BY fraud_rate_percentage DESC;



-- Q37. What is the fraud rate by merchant risk level?

SELECT
    m.risk_level,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
GROUP BY m.risk_level
ORDER BY fraud_rate_percentage DESC;



-- Q38. What is the relationship between transaction status and fraud-marked transactions?

SELECT
    transaction_status,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM transactions
GROUP BY transaction_status
ORDER BY fraud_rate_percentage DESC;



-- Q39. What is the total transaction amount and chargeback amount for fraud-marked transactions?

SELECT
    SUM(t.transaction_amount) AS total_fraud_transaction_value,
    SUM(c.chargeback_amount) AS total_chargeback_amount
FROM transactions t
JOIN chargebacks c
    ON t.transaction_id = c.transaction_id
WHERE t.is_fraud = TRUE;



-- Q40. Which fraud-marked transactions have both fraud alerts and chargebacks?

SELECT
    t.transaction_id,
    t.transaction_amount,
    fa.alert_type,
    fa.alert_severity,
    fa.alert_status,
    c.chargeback_amount,
    c.chargeback_status
FROM transactions t
JOIN fraud_alerts fa
    ON t.transaction_id = fa.transaction_id
JOIN chargebacks c
    ON t.transaction_id = c.transaction_id
WHERE t.is_fraud = TRUE
ORDER BY t.transaction_amount DESC;



-- Q41. Which customers had fraud-marked transactions above ₹100,000?

SELECT
    c.customer_name,
    t.transaction_id,
    t.transaction_amount,
    a.account_type,
    a.account_status
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
WHERE t.is_fraud = TRUE
  AND t.transaction_amount > 100000
ORDER BY t.transaction_amount DESC;



-- Q42. Do inactive accounts have fraud-marked transactions?

SELECT
    a.account_id,
    c.customer_name,
    a.account_status,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    SUM(t.transaction_amount) AS total_transaction_value
FROM accounts a
JOIN customers c
    ON a.customer_id = c.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
WHERE a.account_status = 'Inactive'
GROUP BY
    a.account_id,
    c.customer_name,
    a.account_status;
    
    
    
    -- Q43. Which merchants have a fraud rate above 50%?

SELECT
    m.merchant_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage
FROM merchants m
JOIN transactions t
    ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_name
HAVING fraud_rate_percentage > 50
ORDER BY fraud_rate_percentage DESC;



-- Q44. How many high-value transactions are fraud-marked?

SELECT
    CASE
        WHEN transaction_amount >= 50000 THEN 'High Value'
        ELSE 'Normal Value'
    END AS transaction_value_category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM transactions
GROUP BY transaction_value_category
ORDER BY fraud_rate_percentage DESC;



-- Q45. Which transactions were high-value, occurred at night, and were fraud-marked?

SELECT
    t.transaction_id,
    t.transaction_amount,
    t.transaction_date,
    m.merchant_name,
    l.city,
    m.risk_level AS merchant_risk_level
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
JOIN locations l
    ON t.location_id = l.location_id
WHERE t.is_fraud = TRUE
  AND t.transaction_amount >= 50000
  AND (
        HOUR(t.transaction_date) >= 22
        OR HOUR(t.transaction_date) < 6
      )
ORDER BY t.transaction_amount DESC;



-- Q46. Which customers have the highest total transaction value?

SELECT
    c.customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.transaction_amount) AS total_transaction_value,
    ROUND(AVG(t.transaction_amount), 2) AS average_transaction_value
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_name
ORDER BY total_transaction_value DESC
LIMIT 10;



-- Q47. What is the fraud rate for each customer who has transactions?

SELECT
    c.customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_name
HAVING fraudulent_transactions > 0
ORDER BY fraud_rate_percentage DESC;



-- Q48. Which merchants have a fraud rate above 50% with at least 2 transactions?

SELECT
    m.merchant_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage
FROM merchants m
JOIN transactions t
    ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_name
HAVING COUNT(t.transaction_id) >= 2
   AND fraud_rate_percentage > 50
ORDER BY fraud_rate_percentage DESC;



-- Q49. Rank customers based on their total transaction value.

SELECT
    c.customer_name,
    SUM(t.transaction_amount) AS total_transaction_value,
    RANK() OVER (
        ORDER BY SUM(t.transaction_amount) DESC
    ) AS customer_rank
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_name
ORDER BY customer_rank;



-- Q50. What is the complete risk profile of each fraud-marked transaction?

SELECT
    t.transaction_id,
    c.customer_name,
    m.merchant_name,
    m.merchant_category,
    m.risk_level AS merchant_risk_level,
    l.city AS transaction_city,
    l.risk_zone AS location_risk_zone,
    t.transaction_amount,
    t.payment_channel,
    t.transaction_status,
    t.transaction_date
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN merchants m
    ON t.merchant_id = m.merchant_id
JOIN locations l
    ON t.location_id = l.location_id
WHERE t.is_fraud = TRUE
ORDER BY t.transaction_amount DESC;



-- Q51. Which customers have a total transaction value above the average customer transaction value?

WITH customer_totals AS (
    SELECT
        c.customer_name,
        SUM(t.transaction_amount) AS total_transaction_value
    FROM customers c
    JOIN accounts a
        ON c.customer_id = a.customer_id
    JOIN transactions t
        ON a.account_id = t.account_id
    GROUP BY c.customer_name
)

SELECT
    customer_name,
    total_transaction_value
FROM customer_totals
WHERE total_transaction_value > (
    SELECT AVG(total_transaction_value)
    FROM customer_totals
)
ORDER BY total_transaction_value DESC;



-- Q52. Which merchants have high transaction value and fraud-marked transactions?

WITH merchant_analysis AS (
    SELECT
        m.merchant_name,
        SUM(t.transaction_amount) AS total_transaction_value,
        SUM(CASE WHEN t.is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions
    FROM merchants m
    JOIN transactions t
        ON m.merchant_id = t.merchant_id
    GROUP BY m.merchant_name
)

SELECT
    merchant_name,
    total_transaction_value,
    fraudulent_transactions
FROM merchant_analysis
WHERE total_transaction_value > 100000
  AND fraudulent_transactions > 0
ORDER BY total_transaction_value DESC;



-- Q53. Which transactions are higher than the overall average transaction amount?

SELECT
    transaction_id,
    transaction_amount,
    transaction_status,
    payment_channel,
    is_fraud
FROM transactions
WHERE transaction_amount > (
    SELECT AVG(transaction_amount)
    FROM transactions
)
ORDER BY transaction_amount DESC;



-- Q54. What is the highest-value transaction for each merchant?

WITH ranked_transactions AS (
    SELECT
        m.merchant_name,
        t.transaction_id,
        t.transaction_amount,
        t.is_fraud,
        ROW_NUMBER() OVER (
            PARTITION BY m.merchant_name
            ORDER BY t.transaction_amount DESC
        ) AS transaction_rank
    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
)

SELECT
    merchant_name,
    transaction_id,
    transaction_amount,
    is_fraud
FROM ranked_transactions
WHERE transaction_rank = 1
ORDER BY transaction_amount DESC;



-- Q55. Rank merchants based on their total transaction value using DENSE_RANK().

SELECT
    m.merchant_name,
    SUM(t.transaction_amount) AS total_transaction_value,
    DENSE_RANK() OVER (
        ORDER BY SUM(t.transaction_amount) DESC
    ) AS merchant_rank
FROM merchants m
JOIN transactions t
    ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_name
ORDER BY merchant_rank;



-- Q56. What was the previous transaction amount for each customer's transaction?

SELECT
    c.customer_name,
    t.transaction_id,
    t.transaction_date,
    t.transaction_amount,
    LAG(t.transaction_amount) OVER (
        PARTITION BY c.customer_id
        ORDER BY t.transaction_date
    ) AS previous_transaction_amount
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY c.customer_name, t.transaction_date;



-- Q57. Which transactions were more than twice the customer's previous transaction?

WITH transaction_history AS (
    SELECT
        c.customer_name,
        t.transaction_id,
        t.transaction_date,
        t.transaction_amount,
        LAG(t.transaction_amount) OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date
        ) AS previous_transaction_amount
    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
)

SELECT
    customer_name,
    transaction_id,
    transaction_amount,
    previous_transaction_amount,
    ROUND(
        transaction_amount / previous_transaction_amount,
        2
    ) AS amount_multiple
FROM transaction_history
WHERE previous_transaction_amount IS NOT NULL
  AND transaction_amount > 2 * previous_transaction_amount
ORDER BY amount_multiple DESC;


-- Q58. What was the next transaction amount for each customer's transaction?

SELECT
    c.customer_name,
    t.transaction_id,
    t.transaction_date,
    t.transaction_amount,
    LEAD(t.transaction_amount) OVER (
        PARTITION BY c.customer_id
        ORDER BY t.transaction_date
    ) AS next_transaction_amount
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY c.customer_name, t.transaction_date;



USE fintech_fraud_analytics;

-- Q59. How much did each customer's transaction amount change from the previous transaction?

WITH transaction_history AS (
    SELECT
        c.customer_name,
        t.transaction_id,
        t.transaction_date,
        t.transaction_amount,
        LAG(t.transaction_amount) OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date
        ) AS previous_transaction_amount
    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
)

SELECT
    customer_name,
    transaction_id,
    transaction_amount,
    previous_transaction_amount,
    transaction_amount - previous_transaction_amount AS amount_change
FROM transaction_history
WHERE previous_transaction_amount IS NOT NULL
ORDER BY amount_change DESC;



-- Q60. Which customers had a transaction decrease of more than ₹50,000?

WITH transaction_history AS (
    SELECT
        c.customer_name,
        t.transaction_id,
        t.transaction_amount,
        LAG(t.transaction_amount) OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date
        ) AS previous_transaction_amount
    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
)

SELECT
    customer_name,
    transaction_id,
    transaction_amount,
    previous_transaction_amount,
    transaction_amount - previous_transaction_amount AS amount_change
FROM transaction_history
WHERE previous_transaction_amount IS NOT NULL
  AND transaction_amount - previous_transaction_amount < -50000
ORDER BY amount_change;



-- Q61. Create a reusable view for fraud-marked transactions.

CREATE VIEW fraud_transaction_view AS
SELECT
    t.transaction_id,
    c.customer_name,
    m.merchant_name,
    m.merchant_category,
    m.risk_level AS merchant_risk_level,
    l.city AS transaction_city,
    l.risk_zone AS location_risk_zone,
    t.transaction_amount,
    t.payment_channel,
    t.transaction_status,
    t.transaction_date
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN merchants m
    ON t.merchant_id = m.merchant_id
JOIN locations l
    ON t.location_id = l.location_id
WHERE t.is_fraud = TRUE;



SELECT *
FROM fraud_transaction_view;



-- Q62. Which merchants have the highest fraud-marked transaction value?

SELECT
    merchant_name,
    COUNT(*) AS fraud_transactions,
    SUM(transaction_amount) AS total_fraud_value
FROM fraud_transaction_view
GROUP BY merchant_name
ORDER BY total_fraud_value DESC;



-- Q63. Create an index to improve filtering by fraud status.

CREATE INDEX idx_transactions_is_fraud
ON transactions(is_fraud);


-- Q63. Verify the index.

SHOW INDEX FROM transactions;



-- Q64. Find fraud-marked transactions with both high merchant risk and high location risk.

SELECT
    t.transaction_id,
    c.customer_name,
    m.merchant_name,
    m.risk_level AS merchant_risk_level,
    l.city AS transaction_city,
    l.risk_zone AS location_risk_zone,
    t.transaction_amount,
    t.transaction_date
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN merchants m
    ON t.merchant_id = m.merchant_id
JOIN locations l
    ON t.location_id = l.location_id
WHERE t.is_fraud = TRUE
  AND m.risk_level = 'High'
  AND l.risk_zone = 'High'
ORDER BY t.transaction_amount DESC;



-- Q65. Find cities with the highest total value of fraud-marked transactions.

SELECT
    l.city,
    COUNT(t.transaction_id) AS fraudulent_transactions,
    SUM(t.transaction_amount) AS total_fraud_value
FROM transactions t
JOIN locations l
    ON t.location_id = l.location_id
WHERE t.is_fraud = TRUE
GROUP BY l.city
ORDER BY total_fraud_value DESC;



-- Q66. Find the total fraud-marked transaction value by payment channel.

SELECT
    payment_channel,
    COUNT(*) AS fraudulent_transactions,
    SUM(transaction_amount) AS total_fraud_value
FROM transactions
WHERE is_fraud = TRUE
GROUP BY payment_channel
ORDER BY total_fraud_value DESC;



-- Q67. Find transactions matching three risk signals:
-- high transaction value, night-time activity, and high merchant risk.

SELECT
    t.transaction_id,
    c.customer_name,
    m.merchant_name,
    t.transaction_amount,
    t.transaction_date,
    m.risk_level AS merchant_risk_level,
    CASE
        WHEN t.transaction_amount >= 50000 THEN 'High Value'
        ELSE 'Normal Value'
    END AS value_risk
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN merchants m
    ON t.merchant_id = m.merchant_id
WHERE t.transaction_amount >= 50000
  AND (
        HOUR(t.transaction_date) >= 22
        OR HOUR(t.transaction_date) < 6
      )
  AND m.risk_level = 'High'
ORDER BY t.transaction_amount DESC;



-- Q68. Assign a simple risk score to every transaction based on multiple risk signals.

SELECT
    t.transaction_id,
    c.customer_name,
    m.merchant_name,
    t.transaction_amount,
    t.payment_channel,
    l.city,
    m.risk_level AS merchant_risk_level,
    l.risk_zone AS location_risk_zone,

    (
        CASE
            WHEN t.transaction_amount >= 50000 THEN 1
            ELSE 0
        END
        +
        CASE
            WHEN HOUR(t.transaction_date) >= 22
                 OR HOUR(t.transaction_date) < 6
            THEN 1
            ELSE 0
        END
        +
        CASE
            WHEN m.risk_level = 'High' THEN 1
            ELSE 0
        END
        +
        CASE
            WHEN l.risk_zone = 'High' THEN 1
            ELSE 0
        END
        +
        CASE
            WHEN t.payment_channel = 'Credit Card' THEN 1
            ELSE 0
        END
    ) AS risk_score

FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN merchants m
    ON t.merchant_id = m.merchant_id
JOIN locations l
    ON t.location_id = l.location_id

ORDER BY risk_score DESC, t.transaction_amount DESC;



-- Q69. Categorize transactions into High, Medium, and Low risk.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        c.customer_name,
        m.merchant_name,
        t.transaction_amount,
        t.payment_channel,
        l.city,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    transaction_id,
    customer_name,
    merchant_name,
    transaction_amount,
    payment_channel,
    city,
    risk_score,
    CASE
        WHEN risk_score >= 4 THEN 'High Risk'
        WHEN risk_score >= 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM transaction_risk
ORDER BY risk_score DESC, transaction_amount DESC;



-- Q70. Compare High Risk transactions with their fraud-marked status.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.is_fraud,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    CASE
        WHEN risk_score >= 4 THEN 'High Risk'
        WHEN risk_score >= 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions
FROM transaction_risk
GROUP BY risk_category
ORDER BY total_transactions DESC;



-- Q71. Calculate total transaction value by risk category.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    CASE
        WHEN risk_score >= 4 THEN 'High Risk'
        WHEN risk_score >= 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category,
    COUNT(*) AS total_transactions,
    SUM(transaction_amount) AS total_transaction_value
FROM transaction_risk
GROUP BY risk_category
ORDER BY total_transaction_value DESC;



-- Q72. Analyze risk categories by payment channel.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        t.payment_channel,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    CASE
        WHEN risk_score >= 4 THEN 'High Risk'
        WHEN risk_score >= 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category,
    payment_channel,
    COUNT(*) AS total_transactions,
    SUM(transaction_amount) AS total_transaction_value
FROM transaction_risk
GROUP BY
    risk_category,
    payment_channel
ORDER BY
    risk_category,
    total_transaction_value DESC;
    
    
    
    -- Q73. Analyze High Risk transactions by merchant.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        m.merchant_name,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    merchant_name,
    COUNT(*) AS high_risk_transactions,
    SUM(transaction_amount) AS high_risk_transaction_value
FROM transaction_risk
WHERE risk_score >= 4
GROUP BY merchant_name
ORDER BY high_risk_transaction_value DESC;



-- Q74. Analyze High Risk transactions by city.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        l.city,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    city,
    COUNT(*) AS high_risk_transactions,
    SUM(transaction_amount) AS high_risk_transaction_value
FROM transaction_risk
WHERE risk_score >= 4
GROUP BY city
ORDER BY high_risk_transaction_value DESC;



-- Q75. Analyze High Risk transactions by customer.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        c.customer_name,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    customer_name,
    COUNT(*) AS high_risk_transactions,
    SUM(transaction_amount) AS high_risk_transaction_value
FROM transaction_risk
WHERE risk_score >= 4
GROUP BY customer_name
ORDER BY high_risk_transaction_value DESC;



-- Q76. Analyze High Risk transactions by account type.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        a.account_type,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    account_type,
    COUNT(*) AS high_risk_transactions,
    SUM(transaction_amount) AS high_risk_transaction_value
FROM transaction_risk
WHERE risk_score >= 4
GROUP BY account_type
ORDER BY high_risk_transaction_value DESC;



-- Q77. Analyze High Risk transactions by merchant category.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        m.merchant_category,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    merchant_category,
    COUNT(*) AS high_risk_transactions,
    SUM(transaction_amount) AS high_risk_transaction_value
FROM transaction_risk
WHERE risk_score >= 4
GROUP BY merchant_category
ORDER BY high_risk_transaction_value DESC;



-- Q78. Analyze High Risk transactions by transaction status.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        t.transaction_status,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    transaction_status,
    COUNT(*) AS high_risk_transactions,
    SUM(transaction_amount) AS high_risk_transaction_value
FROM transaction_risk
WHERE risk_score >= 4
GROUP BY transaction_status
ORDER BY high_risk_transaction_value DESC;



-- Q79. Analyze High Risk transactions by fraud alert type.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    fa.alert_type,
    COUNT(*) AS high_risk_transactions
FROM transaction_risk tr
JOIN fraud_alerts fa
    ON tr.transaction_id = fa.transaction_id
WHERE tr.risk_score >= 4
GROUP BY fa.alert_type
ORDER BY high_risk_transactions DESC;



-- Q80. Analyze High Risk transactions by fraud alert severity.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    fa.alert_severity,
    COUNT(*) AS high_risk_transactions
FROM transaction_risk tr
JOIN fraud_alerts fa
    ON tr.transaction_id = fa.transaction_id
WHERE tr.risk_score >= 4
GROUP BY fa.alert_severity
ORDER BY high_risk_transactions DESC;



-- Q81. Find the highest-value transaction of each merchant
-- and compare it with the previous transaction amount.

WITH merchant_transactions AS (
    SELECT
        m.merchant_name,
        t.transaction_id,
        t.transaction_date,
        t.transaction_amount,

        LAG(t.transaction_amount) OVER (
            PARTITION BY m.merchant_id
            ORDER BY t.transaction_date
        ) AS previous_transaction_amount,

        ROW_NUMBER() OVER (
            PARTITION BY m.merchant_id
            ORDER BY t.transaction_amount DESC
        ) AS transaction_rank

    FROM transactions t
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
)

SELECT
    merchant_name,
    transaction_id,
    transaction_amount,
    previous_transaction_amount,
    transaction_amount - previous_transaction_amount AS amount_change
FROM merchant_transactions
WHERE transaction_rank = 1
ORDER BY transaction_amount DESC;



-- Q82. Compare average and highest transaction amount for each merchant.

SELECT
    m.merchant_name,
    ROUND(AVG(t.transaction_amount), 2) AS average_transaction_amount,
    MAX(t.transaction_amount) AS highest_transaction_amount,
    ROUND(
        MAX(t.transaction_amount) - AVG(t.transaction_amount),
        2
    ) AS difference_from_average
FROM merchants m
JOIN transactions t
    ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_name
ORDER BY highest_transaction_amount DESC;



-- Q83. Analyze merchant performance and fraud risk together.

SELECT
    m.merchant_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE
        WHEN t.is_fraud = TRUE THEN 1
        ELSE 0
    END) AS fraudulent_transactions,
    ROUND(
        SUM(CASE
            WHEN t.is_fraud = TRUE THEN 1
            ELSE 0
        END) * 100.0
        / COUNT(t.transaction_id),
        2
    ) AS fraud_rate_percentage,
    SUM(t.transaction_amount) AS total_transaction_value
FROM merchants m
JOIN transactions t
    ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_name
ORDER BY fraud_rate_percentage DESC,
         total_transaction_value DESC;
         
         
         
-- Q84. Assign transaction sequence numbers to each customer.

SELECT
    c.customer_name,
    t.transaction_id,
    t.transaction_date,
    t.transaction_amount,

    ROW_NUMBER() OVER (
        PARTITION BY c.customer_id
        ORDER BY t.transaction_date
    ) AS transaction_sequence

FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id

ORDER BY c.customer_name,
         transaction_sequence;
         
         
         
-- Q85. Find the latest transaction of each customer.

WITH customer_transactions AS (
    SELECT
        c.customer_name,
        t.transaction_id,
        t.transaction_date,
        t.transaction_amount,

        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date DESC
        ) AS transaction_rank

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
)

SELECT
    customer_name,
    transaction_id,
    transaction_date,
    transaction_amount
FROM customer_transactions
WHERE transaction_rank = 1
ORDER BY transaction_date DESC;



-- Q86. Find the latest transaction of each customer
-- and check its fraud status.

WITH customer_transactions AS (
    SELECT
        c.customer_name,
        t.transaction_id,
        t.transaction_date,
        t.transaction_amount,
        t.is_fraud,

        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date DESC
        ) AS transaction_rank

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
)

SELECT
    customer_name,
    transaction_id,
    transaction_date,
    transaction_amount,
    CASE
        WHEN is_fraud = TRUE THEN 'Fraud Marked'
        ELSE 'Not Fraud Marked'
    END AS fraud_status
FROM customer_transactions
WHERE transaction_rank = 1
ORDER BY transaction_date DESC;



-- Q87. Compare each customer's latest transaction
-- with their previous transaction amount.

WITH transaction_history AS (
    SELECT
        c.customer_name,
        t.transaction_id,
        t.transaction_date,
        t.transaction_amount,

        LAG(t.transaction_amount) OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date
        ) AS previous_transaction_amount,

        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date DESC
        ) AS transaction_rank

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
)

SELECT
    customer_name,
    transaction_id,
    transaction_amount,
    previous_transaction_amount,
    transaction_amount - previous_transaction_amount AS amount_change
FROM transaction_history
WHERE transaction_rank = 1
  AND previous_transaction_amount IS NOT NULL
ORDER BY amount_change DESC;



-- Q88. Find customers whose latest transaction
-- increased by more than ₹50,000 compared with
-- their previous transaction, and check fraud status.

WITH transaction_history AS (
    SELECT
        c.customer_name,
        t.transaction_id,
        t.transaction_date,
        t.transaction_amount,
        t.is_fraud,

        LAG(t.transaction_amount) OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date
        ) AS previous_transaction_amount,

        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date DESC
        ) AS transaction_rank

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
)

SELECT
    customer_name,
    transaction_id,
    transaction_amount,
    previous_transaction_amount,
    transaction_amount - previous_transaction_amount AS amount_increase,
    CASE
        WHEN is_fraud = TRUE THEN 'Fraud Marked'
        ELSE 'Not Fraud Marked'
    END AS fraud_status
FROM transaction_history
WHERE transaction_rank = 1
  AND previous_transaction_amount IS NOT NULL
  AND transaction_amount - previous_transaction_amount > 50000
ORDER BY amount_increase DESC;



-- Q89. Find High Risk transactions that resulted in chargebacks.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        t.transaction_amount,
        c.customer_name,
        m.merchant_name,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    tr.customer_name,
    tr.transaction_id,
    tr.merchant_name,
    tr.transaction_amount,
    tr.risk_score,
    cb.chargeback_amount,
    cb.chargeback_status
FROM transaction_risk tr
JOIN chargebacks cb
    ON tr.transaction_id = cb.transaction_id
WHERE tr.risk_score >= 4
ORDER BY tr.risk_score DESC,
         tr.transaction_amount DESC;
         
         
         
-- Q90. Prioritize High Risk transactions based on
-- risk score and financial exposure.

WITH transaction_risk AS (
    SELECT
        t.transaction_id,
        c.customer_name,
        m.merchant_name,
        t.transaction_amount,
        t.payment_channel,

        (
            CASE
                WHEN t.transaction_amount >= 50000 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN HOUR(t.transaction_date) >= 22
                     OR HOUR(t.transaction_date) < 6
                THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN m.risk_level = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN l.risk_zone = 'High' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN t.payment_channel = 'Credit Card' THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    JOIN customers c
        ON a.customer_id = c.customer_id
    JOIN merchants m
        ON t.merchant_id = m.merchant_id
    JOIN locations l
        ON t.location_id = l.location_id
)

SELECT
    transaction_id,
    customer_name,
    merchant_name,
    transaction_amount,
    payment_channel,
    risk_score,
    CASE
        WHEN risk_score = 5 THEN 'Priority 1'
        WHEN risk_score = 4 THEN 'Priority 2'
        ELSE 'Normal'
    END AS review_priority
FROM transaction_risk
WHERE risk_score >= 4
ORDER BY risk_score DESC,
         transaction_amount DESC;