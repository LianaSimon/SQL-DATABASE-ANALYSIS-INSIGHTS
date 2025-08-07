# EXERCISE 1 : E-commerce Database Audit & SQL Analysis Project

# Create and Use a Database
CREATE DATABASE ASSIGNMENT;
USE ASSIGNMENT;

# 1. Data Import & Exploration
# Create the table
# Import the CSV into MySQL
# Using MySQL Workbench-Right-click your database → Table Data Import Wizard-Select the CSV file → Map to Transactions table-Click Next → Done!

SET SQL_SAFE_UPDATES=0;
ALTER TABLE onlineretail MODIFY InvoiceNo VARCHAR(20);
ALTER TABLE onlineretail MODIFY StockCode VARCHAR(20);
ALTER TABLE onlineretail MODIFY Description TEXT;
ALTER TABLE onlineretail MODIFY Quantity INT;
ALTER TABLE onlineretail MODIFY COLUMN InvoiceDate DATETIME;
ALTER TABLE onlineretail MODIFY UnitPrice FLOAT;
ALTER TABLE onlineretail MODIFY CustomerID VARCHAR(20);
ALTER TABLE onlineretail MODIFY Country VARCHAR(50);
  
#RENAME - to rename the table name
ALTER TABLE onlineretail
RENAME TO Transactions;


SET GLOBAL local_infile=1;

#  Initial Data Exploration Queries

# View first 10 rows
SELECT * FROM Transactions
LIMIT 10;

# Check Null Values
SELECT
SUM(CASE WHEN InvoiceNo IS NULL THEN 1 ELSE 0 END) AS Null_InvoiceNo,
SUM(CASE WHEN StockCode IS NULL THEN 1 ELSE 0 END) AS Null_StockCode,
SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS Null_Description,
SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Null_Quantity,
SUM(CASE WHEN InvoiceDate IS NULL THEN 1 ELSE 0 END) AS Null_InvoiceDate,
SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS Null_UnitPrice,
SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS Null_CustomerID,
SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Null_Country
FROM Transactions;


#Count Duplicate Rows

SELECT InvoiceNo,StockCode,Description,Quantity,InvoiceDate,UnitPrice,CustomerID,COUNT(*) AS Count
FROM Transactions
GROUP BY InvoiceNo,StockCode,Description,Quantity,InvoiceDate,UnitPrice,CustomerID
HAVING COUNT(*)>1;

# Create a Cleaned Version of the Table
CREATE TABLE clean_Transactions AS
SELECT DISTINCT InvoiceNo,StockCode,Description,Quantity,InvoiceDate,UnitPrice,CustomerID,Country
FROM Transactions;

# OPTIONAL: Check row count before and after

SELECT * FROM Transactions;
SELECT * FROM clean_Transactions;

-- STEP 2: Check for NULLs in Important Columns
SELECT 
  SUM(CASE WHEN InvoiceNo IS NULL THEN 1 ELSE 0 END) AS Null_InvoiceNo,
  SUM(CASE WHEN StockCode IS NULL THEN 1 ELSE 0 END) AS Null_StockCode,
  SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS Null_Description,
  SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Null_Quantity,
  SUM(CASE WHEN InvoiceDate IS NULL THEN 1 ELSE 0 END) AS Null_InvoiceDate,
  SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS Null_UnitPrice,
  SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS Null_CustomerID,
  SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Null_Country
FROM clean_Transactions;


-- OPTIONAL: Filter out rows with negative Quantity/UnitPrice and null CustomerID
-- Create a filtered view or temporary table

CREATE VIEW Valid_Transactions AS
SELECT * 
FROM clean_Transactions
WHERE Quantity>0 AND UnitPrice>0 AND CustomerID IS NOT NULL;


#Total Revenue:
SELECT ROUND(SUM(Quantity*UnitPrice),2) As Total_Revenue
FROM Valid_Transactions;

# TOP 5 PRODUCTS BY REVENUE
SELECT Description,ROUND(SUM(Quantity*UnitPrice),2) AS Revenue
FROM Valid_Transactions
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 5;


# TOP 5 CUSTOMERS BASED ON SPENDING
SELECT CustomerID,ROUND(SUM(Quantity*UnitPrice),2) AS Total_Spent
FROM Valid_Transactions
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 5;

# MONTHLY SALES TREND
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue
FROM Valid_Transactions
GROUP BY Month
ORDER BY Month;


# Query Optimization Suggestion (Index)
-- If performance is slow, you can add indexes like:
CREATE INDEX idx_invoice_date ON clean_Transactions (InvoiceDate);
CREATE INDEX idx_customer_id ON clean_Transactions (CustomerID);