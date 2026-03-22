Q1
SELECT d.year, d.month, p.category, SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY d.year, d.month, p.category;

Q2
SELECT * FROM (
    SELECT s.store_name, SUM(f.sales_amount) AS revenue
    FROM fact_sales f
    JOIN dim_store s ON f.store_id = s.store_id
    GROUP BY s.store_name
    ORDER BY revenue DESC
)
WHERE ROWNUM <= 2;

Q3
SELECT d.year, d.month, SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
