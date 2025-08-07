# SQL-DATABASE-ANALYSIS

##### “Analyzed an e-commerce retail dataset using SQL to uncover revenue drivers, customer value, and sales trends, with a focus on data cleaning and query optimization.”

## 🛒 E-commerce Database Audit & SQL Analysis Project

### 📌 Project Overview

This project simulates a real-world SQL-based audit of an e-commerce dataset (Online Retail), aiming to uncover business-critical insights. The focus is on cleaning the data, analyzing transactions, and writing optimized SQL queries to support key business decisions.

---

### 🎯 Objectives

- Clean and deduplicate transaction data
- Analyze total revenue and top-performing products
- Identify high-value customers
- Discover monthly sales trends
- Apply SQL best practices and query optimization

---

### 🗃️ Dataset Description

The dataset used is `OnlineRetail.csv`, containing UK-based retail transactions from 2010 to 2011.

| Column Name   | Description                              |
|---------------|------------------------------------------|
| InvoiceNo     | Unique identifier for the transaction     |
| StockCode     | Unique product code                       |
| Description   | Product name/description                  |
| Quantity      | Number of units purchased                 |
| InvoiceDate   | Date and time of the transaction          |
| UnitPrice     | Price per unit of the product             |
| CustomerID    | Identifier for the customer               |
| Country       | Country of the customer                   |



### 🗂 1. Data Import & Exploration

#### A. Import CSV into SQL (MySQL / PostgreSQL / SQLite / etc.)

You can import the dataset using your preferred SQL tool (e.g., MySQL Workbench, pgAdmin, SQLiteStudio).

If using MySQL Workbench:

##### A1. Create a database:

<img width="798" height="57" alt="image" src="https://github.com/user-attachments/assets/b53e599e-6b74-42f6-ba40-d2fc183835dc" />

##### A2.Create a table:

CREATE TABLE Transactions (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice FLOAT,
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);


##### A3. Import the CSV using Table Data Import Wizard in MySQL Workbench.

#### B. Initial Data Exploration Queries

* View First 10 rows


<img width="1911" height="1012" alt="image" src="https://github.com/user-attachments/assets/1b742b4e-d500-4120-a5a2-3b798745a0be" />


* Check Null Values

<img width="1917" height="1012" alt="image" src="https://github.com/user-attachments/assets/71c0b7d0-f786-4f4f-a8ed-eb63055ea25d" />


* Count Duplicate Rows

<img width="1918" height="1017" alt="image" src="https://github.com/user-attachments/assets/bf10cbf4-c8da-405a-9cd6-ba466c572ab2" />


* Create a Cleaned Version of the Table

If you don’t want to delete rows from the original, create a cleaned copy:

<img width="1310" height="132" alt="image" src="https://github.com/user-attachments/assets/cbe5f392-2d5c-49a9-a43a-5b8281723d07" />


* OPTIONAL: Check row count before and after

<img width="1487" height="405" alt="image" src="https://github.com/user-attachments/assets/8e452ed2-7c96-4f79-a565-57a2de2db83c" />


Check for NULLs in Important Columns

<img width="1507" height="541" alt="image" src="https://github.com/user-attachments/assets/da7863ad-367c-4653-80dd-5706cbbaff58" />


-- OPTIONAL: Filter out rows with negative Quantity/UnitPrice and null CustomerID

-- Create a filtered view or temporary table

<img width="1917" height="1016" alt="image" src="https://github.com/user-attachments/assets/b500ae2e-d924-4056-b443-5e77b63d1666" />



🧼 Data Cleaning Process

1. **Removed duplicate rows** using `SELECT DISTINCT`.
2. **Filtered invalid rows**: Quantity ≤ 0, UnitPrice ≤ 0, and null CustomerIDs were excluded.
3. Created a `Valid_Transactions` view for clean analysis.
4. Verified date format and converted `InvoiceDate` to `DATETIME` where required.



## 🧮 SQL Queries Used

> All queries were executed on the `Transactions_Cleaned` table and `Valid_Transactions` view.

* TOTAL REVENUE

<img width="1511" height="262" alt="image" src="https://github.com/user-attachments/assets/eea439d7-cfe3-4b5a-8b40-17dc69e1805c" />


* TOP 5 PRODUCTS BY REVENUE

<img width="1508" height="377" alt="image" src="https://github.com/user-attachments/assets/fe5bed86-7d02-4471-b058-d82a566bc7c8" />


* TOP 5 CUSTOMERS BASED ON SPENDING

<img width="1502" height="402" alt="image" src="https://github.com/user-attachments/assets/361bf48d-091b-41c6-92b2-8abaeec8a55a" />


* MONTHLY SALES TREND

<img width="1523" height="508" alt="image" src="https://github.com/user-attachments/assets/8ffa9620-d395-42f5-b5ef-c63ecf6668c2" />

*QUERY OPTIMIZATION SUGGESTION (INDEX)

<img width="978" height="242" alt="image" src="https://github.com/user-attachments/assets/2e3a3120-d8ac-45c8-ae71-dca24a2dd20b" />



## 📈 Key Insights

A few products dominate the revenue generation.

Some customers contribute disproportionately to total sales.


## 🧠 Reflection

This project offered practical exposure to real-world data audit challenges in SQL:

Managing dirty and duplicate data

Writing optimized, business-friendly queries

Gaining analytical insights using only SQL

Seasonal spikes in revenue indicate stronger sales during year-end months.


## ✅ Tech Stack

Database: MySQL

Tools: MySQL Workbench, Excel (optional for validation)

Language: SQL



## 🧾 Conclusion


Through this SQL-based audit and analysis of the Online Retail dataset, I was able to simulate a real-world business intelligence project using only raw transactional data and structured queries. Key takeaways include:

Data Quality is Critical: The initial dataset contained duplicates, missing values, and invalid entries. Cleaning the data was essential for accurate analysis.

SQL is Powerful for Business Insight: Using basic to advanced SQL queries, I was able to identify high-revenue products, valuable customers, and sales patterns over time—insights that would directly support marketing, inventory, and customer retention strategies.

Trends Matter: The monthly sales analysis revealed seasonal fluctuations, highlighting opportunities for time-based promotions or campaigns.

Customer Focus is Key: A small subset of customers drove a large share of the revenue, which implies the importance of loyalty programs and targeted outreach.

This project not only enhanced my skills in SQL and data auditing but also reinforced the importance of structured thinking and clean data in deriving actionable business insights.


