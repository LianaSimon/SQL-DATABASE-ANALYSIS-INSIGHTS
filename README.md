# SQL-DATABASE-ANALYSIS-INSIGHTS

## E-commerce Database Audit & SQL Analysis Project

### 🗂 1. Data Import & Exploration

* Step 1: Set Up Your SQL Environment

Assumptions:

You're using MySQL Workbench.

You've downloaded the Online Retail.csv file from Kaggle.

You're going to import this into a table named Transactions.


* Step 2: Create the Table in MySQL

Here’s a SQL command to create the table matching the column structure of the Online Retail dataset:


* Step 3: Import the CSV into MySQL

Using MySQL Workbench

Right-click your database → Table Data Import Wizard

Select the CSV file → Map to Transactions table

Click Next → Done!


* Step 4: Understand the Data
  
✅ List of Columns
Typical columns in the dataset:

InvoiceNo: Transaction ID

StockCode: Product ID

Description: Product name

Quantity: Items sold

InvoiceDate: Date of sale

UnitPrice: Price per item

CustomerID: Buyer ID

Country: Buyer’s country

🔍 Sample Query


SELECT * FROM Transactions LIMIT 10;


