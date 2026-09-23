# FinTech Transaction & Fraud Analytics | MySQL

## Project Overview

This project analyzes a simulated FinTech transaction dataset using MySQL to identify transaction patterns, fraud-marked activity, customer behavior changes, chargebacks, and risk signals.

The project demonstrates how SQL can be used to transform raw transaction data into business-oriented insights that can support risk monitoring and review prioritization.

## Business Problem

A FinTech company processes a large number of financial transactions. Simply storing transaction data is not sufficient to understand unusual activity and financial risk.

The objective of this project is to analyze transaction data and identify meaningful patterns related to fraud-marked transactions, customer behavior, merchant risk, locations, payment channels, alerts, and chargebacks.

## Business Objectives

* Analyze transaction volume and transaction value
* Identify fraud-marked transaction patterns
* Analyze payment channel, merchant and location patterns
* Understand customer transaction behavior
* Analyze fraud alerts and chargebacks
* Measure financial exposure
* Create a rule-based transaction risk scoring framework
* Prioritize high-risk transactions for review

## Dataset & Database Design

The database contains 8 related tables:

1. `customers` — Customer information
2. `accounts` — Customer account information
3. `merchants` — Merchant and merchant risk information
4. `transactions` — Main transaction data
5. `payment_methods` — Payment method information
6. `locations` — Transaction location and risk-zone information
7. `fraud_alerts` — Fraud/risk alerts
8. `chargebacks` — Transaction dispute and chargeback information

The `transactions` table acts as the central analytical table and connects transaction activity with customers, accounts, merchants, locations, alerts and chargebacks.

## SQL Concepts Used

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* LIMIT
* COUNT()
* SUM()
* AVG()
* MAX()
* GROUP BY
* HAVING
* CASE
* JOINs
* Subqueries
* Common Table Expressions (CTEs)
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* LAG()
* LEAD()
* Views
* Indexes
* Date and conditional functions

## Analysis Performed

### Transaction Analysis

* Total transaction count
* Successful and failed transactions
* Total and average transaction value
* Payment-channel analysis
* City-wise transaction value

### Fraud Pattern Analysis

* Fraud-marked transaction count and value
* Fraud rate by payment channel
* Merchant-level fraud patterns
* City-wise fraud patterns
* Account-type analysis
* Merchant-category analysis

### Customer Behavior Analysis

* Customer transaction ranking
* Transaction sequence analysis
* Latest transaction identification
* Previous and next transaction comparison
* Sudden transaction amount changes

### Merchant Analysis

* Merchant transaction volume
* Merchant transaction value
* Average and highest transaction amount
* Merchant risk-level analysis
* Fraud-marked activity

### Alert & Chargeback Analysis

* Alert severity
* Alert type
* Alert status
* Chargeback amount and status
* High-risk transactions linked with chargebacks

## Risk Scoring Framework

A rule-based risk score was created using five transaction-level signals:

| Risk Signal                  | Score |
| ---------------------------- | ----: |
| Transaction amount ≥ ₹50,000 |    +1 |
| Night-time transaction       |    +1 |
| High-risk merchant           |    +1 |
| High-risk location           |    +1 |
| Credit Card payment          |    +1 |

Risk categories:

* **4–5:** High Risk
* **2–3:** Medium Risk
* **0–1:** Low Risk

A review-priority framework was then created for High Risk transactions.

## Key Business Insights

* 8 fraud-marked transactions were identified with a total transaction value of **₹8.53 lakh**.
* Fraud-marked activity in the simulated dataset was concentrated in Credit Card transactions.
* High-risk activity was concentrated across four merchants: CloudServices Plus, TravelGo, LuxuryHub and GameWorld Online.
* All fraud-marked transactions in this dataset occurred during the defined night-time window of 10 PM–6 AM.
* All fraud-marked transactions were valued at ₹50,000 or more.
* 7 High Risk transactions were linked with chargebacks, representing **₹7.58 lakh** in chargeback exposure.
* Customer transaction history revealed significant increases for some customers, including increases of more than ₹50,000.
* High-risk transactions were prioritized using risk score and financial exposure.
* Delhi had the highest number of fraud-marked transactions in the simulated dataset.
* An inactive account was associated with transaction activity, providing an account-status validation signal.

## Business Recommendations

* Apply additional review to transactions with multiple risk signals.
* Monitor unusual high-value and night-time transactions.
* Combine risk indicators with chargeback information to understand financial exposure.
* Monitor merchant-level risk and transaction concentration.
* Monitor significant deviations from a customer's historical transaction behavior.
* Validate transaction activity against account status.
* Use larger historical datasets to validate risk rules and thresholds before real-world deployment.

## Project Limitations

* The dataset contains only 30 transactions.
* The dataset is simulated and does not represent real financial institution data.
* All current transactions have the same transaction type (`Purchase`).
* The dataset covers a limited time period.
* The risk scoring system is rule-based and is not a machine-learning fraud detection model.
* The identified patterns should not be generalized to real-world fraud behavior.
* Larger historical labeled data would be required to validate the risk framework.

## Conclusion

This project demonstrates how MySQL can be used not only to retrieve data but also to perform analytical investigation and generate business-oriented insights.

Using SQL joins, aggregations, CTEs, subqueries, window functions, views and indexing, the project analyzes transaction behavior, fraud-marked activity, customer patterns, merchant risk, alerts and chargebacks.

The final risk-scoring framework demonstrates how multiple transaction signals can be combined to support risk monitoring and review prioritization.

## Technologies Used

* MySQL
* MySQL Workbench
* SQL

## Project Files

* `FinTech_Fraud_Analytics.sql` — Complete database creation, data insertion, SQL analysis queries, view and index implementation.
