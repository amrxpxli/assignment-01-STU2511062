Q1
SELECT c.customer_name,
       SUM(p.unit_price * od.quantity) AS total_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE c.customer_city = 'Mumbai'
GROUP BY c.customer_name;


Q2
SELECT p.product_name,
       SUM(od.quantity) AS total_quantity
FROM Products p
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;

Q3
SELECT sr.sales_rep_name,
       COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Sales_Reps sr
JOIN Orders o ON sr.sales_rep_id = o.sales_rep_id
GROUP BY sr.sales_rep_name;

Q4
SELECT o.order_id,
       SUM(p.unit_price * od.quantity) AS total_value
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY o.order_id
HAVING total_value > 10000
ORDER BY total_value DESC;

Q5
SELECT p.product_name
FROM Products p
LEFT JOIN Order_Details od ON p.product_id = od.product_id
WHERE od.product_id IS NULL;