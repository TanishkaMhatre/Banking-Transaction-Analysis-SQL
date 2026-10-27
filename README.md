# Banking Transaction Analysis using SQL

## Project Overview
An SQL-based analysis of 550,000 Indian banking transactions using MySQL. The project explores transaction performance, success rates, customer activity, and fraud patterns.

## Tools Used
- MySQL
- MySQL Workbench
- SQL

## Dataset
- **Records:** 550,000
- **Columns:** 20
- **Period:** January 2019 – January 2024
- **Table:** `bank.indian_banking_transactions`

## Business Questions
1. Which transaction types have the highest transaction volume?
2. What is the transaction status distribution?
3. How do transaction amounts change monthly?
4. Which states have the highest transaction amounts?
5. How many customers have cumulative transaction amounts above 100,000?
6. How many transactions are flagged as fraudulent?
7. Which transaction types have the most fraud-flagged transactions?
8. What is the success rate for each transaction type?

## Key Findings
- **UPI:** Highest transaction count, with 153,986 transactions.
- **RTGS:** Highest total transaction amount, at approximately 8.88 billion.
- **Successful transactions:** 506,247 out of 550,000.
- **Fraud-flagged transactions:** 4,873, approximately 0.89% of all transactions.
- **High-value customers:** 35,785 had cumulative transaction amounts above 100,000.
- **Highest state total:** Maharashtra, at approximately 2.98 billion.
- **Highest success rate:** Credit Card, at 92.12%.
- **Lowest success rate:** Auto Debit, at 91.92%.

## SQL Concepts Practised
`SELECT`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, aggregate functions, `CASE WHEN`, conditional aggregation, date functions, and subqueries.


## Conclusion
This project demonstrates how SQL can be used to analyse transaction performance, compare success rates, identify customer activity patterns, and investigate fraud indicators.

Note: This is a portfolio project based on a Kaggle dataset. The findings describe the dataset and are not verified conclusions about a real bank.
