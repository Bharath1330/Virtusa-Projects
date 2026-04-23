CREATE DATABASE online_retail;
USE online_retail;

--Create Customers, Products, Orders, Order_Items tables 
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


--Insert sample data 
INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Divya Reddy', 'Hyderabad'),
(2, 'Karthik Nair', 'Chennai'),
(3, 'Pooja Sinha', 'Pune'),
(4, 'Rohan Patel', 'Ahmedabad'),
(5, 'Ananya Das', 'Kolkata'),
(6, 'Manoj Kumar', 'Bangalore');

INSERT INTO Products (product_id, name, category, price) VALUES
(101, 'Bluetooth Speaker', 'Electronics', 2999.00),
(102, 'Power Bank', 'Electronics', 1499.00),
(103, 'Water Bottle', 'Home', 499.00),
(104, 'Study Table', 'Furniture', 6500.00),
(105, 'Gel Pen Set', 'Stationery', 250.00),
(106, 'Notebook Pack', 'Stationery', 399.00);

INSERT INTO Orders (order_id, customer_id, date) VALUES
(1001, 1, '2026-01-08'),
(1002, 2, '2026-01-19'),
(1003, 1, '2026-02-07'),
(1004, 3, '2026-02-24'),
(1005, 4, '2026-03-06'),
(1006, 2, '2026-03-15'),
(1007, 5, '2026-03-27');

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1001, 101, 1),
(1001, 105, 2),
(1002, 102, 2),
(1002, 106, 3),
(1003, 104, 1),
(1003, 103, 2),
(1004, 101, 1),
(1004, 102, 1),
(1005, 105, 6),
(1006, 106, 4),
(1006, 103, 1),
(1007, 101, 2);

--Create indexes for performance
CREATE INDEX idx_orders_customer ON Orders(customer_id);
CREATE INDEX idx_orders_date ON Orders(date);
CREATE INDEX idx_orderitems_order ON Order_Items(order_id);
CREATE INDEX idx_orderitems_product ON Order_Items(product_id);
CREATE INDEX idx_products_category ON Products(category);

--Join all tables to see complete sales details
SELECT
    o.order_id,
    o.date AS order_date,
    c.name AS customer_name,
    c.city,
    p.name AS product_name,
    p.category,
    p.price,
    oi.quantity,
    (p.price * oi.quantity) AS item_total
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
ORDER BY o.date ASC, o.order_id ASC;

--Top‑selling products (by quantity)
SELECT
    p.product_id,
    p.name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name, p.category
ORDER BY total_quantity_sold DESC, p.name ASC;

--Most valuable customers (by total spending)
SELECT
    c.customer_id,
    c.name,
    c.city,
    ROUND(SUM(p.price * oi.quantity), 2) AS amount_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY amount_spent DESC;

--Monthly revenue (using FORMAT)
SELECT 
    FORMAT(o.date, 'yyyy-MM') AS revenue_month,
    ROUND(SUM(oi.quantity * p.price), 2) AS monthly_revenue
FROM Orders o
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY FORMAT(o.date, 'yyyy-MM')
ORDER BY revenue_month;

--Category‑wise sales analysis
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units,
    ROUND(SUM(oi.quantity * p.price), 2) AS category_sales
FROM Products p
JOIN Order_Items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY category_sales DESC;

--Inactive customers (no orders)
SELECT
    c.customer_id,
    c.name,
    c.city
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
