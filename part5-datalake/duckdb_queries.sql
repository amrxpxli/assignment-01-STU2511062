Q1
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('customers.csv') c
LEFT JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

Q2
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 3;

Q3
SELECT DISTINCT 
    p.product_name
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
CROSS JOIN read_parquet('products.parquet') p
WHERE c.city = 'Bangalore';

Q4
SELECT 
    c.name AS customer_name,
    o.order_date,
    p.product_name,
    o.num_items AS quantity
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
CROSS JOIN read_parquet('products.parquet') p;