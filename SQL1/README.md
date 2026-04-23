# Online Retail Sales Analysis Database

## Project Overview
This project is designed to analyze online retail sales data using SQL Server.  
It creates a relational database for an online store and uses SQL queries to extract useful business insights.

## Problem Statement
Retail businesses generate a large amount of sales data, but raw data alone does not help in decision-making.  
This project organizes customer, product, and order data into a structured relational database and performs SQL analysis to understand sales performance.

## Objectives
- Create a relational database for an online retail store
- Store customer, product, order, and order item data
- Analyze sales performance using SQL queries
- Generate meaningful business insights for decision-making

## Database Tables
The database contains the following tables:

### 1. Customers
Stores customer details.
- customer_id
- name
- city

### 2. Products
Stores product details.
- product_id
- name
- category
- price

### 3. Orders
Stores order-level details.
- order_id
- customer_id
- date

### 4. Order_Items
Stores item-level order details.
- order_id
- product_id
- quantity

## Key Analysis Performed
The SQL queries in this project perform the following tasks:

- Display complete sales transaction details
- Find top-selling products
- Identify most valuable customers
- Calculate monthly revenue
- Perform category-wise sales analysis
- Detect inactive customers

## SQL Features Used
- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- INSERT INTO
- JOIN
- GROUP BY
- ORDER BY
- SUM
- COUNT
- ROUND
- FORMAT
- LEFT JOIN

## Sample Insights
This project helps answer questions like:
- Which products are selling the most?
- Which customers spend the most?
- How much revenue is generated each month?
- Which product categories perform best?
- Which customers have not placed any orders?

## How to Run the Project
1. Open SQL Server Management Studio (SSMS).
2. Create a new query window.
3. Run the database creation script.
4. Run the table creation queries.
5. Insert sample records into all tables.
6. Execute the analysis queries one by one.
7. View the outputs in the results panel.

## Example Queries Included
- Complete sales details query
- Top-selling products query
- Most valuable customers query
- Monthly revenue query
- Category-wise sales query
- Inactive customers query

## Expected Outcome
A structured database is created for an online retail store, and SQL queries provide business insights related to product 
performance, customer value, revenue trends, and inactive customers.

## Conclusion
This project demonstrates how SQL can be used not only to store data but also to analyze it for better business decisions.  
It is useful for learning database design, table relationships, joins, aggregation, and reporting queries in SQL Server.
