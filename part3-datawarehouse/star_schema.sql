CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    sales_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

1. INSERT INTO dim_date

INSERT INTO dim_date VALUES (1, TO_DATE('2024-03-01','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (2, TO_DATE('2024-03-02','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (3, TO_DATE('2024-03-03','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (4, TO_DATE('2024-03-04','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (5, TO_DATE('2024-03-05','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (6, TO_DATE('2024-03-06','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (7, TO_DATE('2024-03-07','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (8, TO_DATE('2024-03-08','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (9, TO_DATE('2024-03-09','YYYY-MM-DD'), 3, 2024);
INSERT INTO dim_date VALUES (10, TO_DATE('2024-03-10','YYYY-MM-DD'), 3, 2024);

2. INSERT INTO dim_store

INSERT INTO dim_store VALUES (1, 'Store A', 'Mumbai');
INSERT INTO dim_store VALUES (2, 'Store B', 'Delhi');
INSERT INTO dim_store VALUES (3, 'Store C', 'Bangalore');
INSERT INTO dim_store VALUES (4, 'Store D', 'Chennai');
INSERT INTO dim_store VALUES (5, 'Store E', 'Kolkata');
INSERT INTO dim_store VALUES (6, 'Store F', 'Pune');
INSERT INTO dim_store VALUES (7, 'Store G', 'Hyderabad');
INSERT INTO dim_store VALUES (8, 'Store H', 'Ahmedabad');
INSERT INTO dim_store VALUES (9, 'Store I', 'Jaipur');
INSERT INTO dim_store VALUES (10, 'Store J', 'Lucknow');

3. INSERT INTO dim_product

INSERT INTO dim_product VALUES (1, 'iPhone', 'Electronics');
INSERT INTO dim_product VALUES (2, 'Samsung TV', 'Electronics');
INSERT INTO dim_product VALUES (3, 'Laptop', 'Electronics');
INSERT INTO dim_product VALUES (4, 'Shirt', 'Clothing');
INSERT INTO dim_product VALUES (5, 'Jeans', 'Clothing');
INSERT INTO dim_product VALUES (6, 'Rice Bag', 'Grocery');
INSERT INTO dim_product VALUES (7, 'Wheat Flour', 'Grocery');
INSERT INTO dim_product VALUES (8, 'Milk', 'Dairy');
INSERT INTO dim_product VALUES (9, 'Cheese', 'Dairy');
INSERT INTO dim_product VALUES (10, 'Sofa', 'Furniture');

4. INSERT INTO fact_sales
INSERT INTO fact_sales VALUES (1, 1, 1, 1, 2, 100000);
INSERT INTO fact_sales VALUES (2, 2, 2, 2, 1, 50000);
INSERT INTO fact_sales VALUES (3, 3, 3, 3, 1, 70000);
INSERT INTO fact_sales VALUES (4, 4, 4, 4, 3, 3000);
INSERT INTO fact_sales VALUES (5, 5, 5, 5, 2, 4000);
INSERT INTO fact_sales VALUES (6, 6, 6, 6, 5, 2500);
INSERT INTO fact_sales VALUES (7, 7, 7, 7, 4, 2000);
INSERT INTO fact_sales VALUES (8, 8, 8, 8, 6, 1200);
INSERT INTO fact_sales VALUES (9, 9, 9, 9, 2, 1800);
INSERT INTO fact_sales VALUES (10, 10, 10, 10, 1, 25000);
INSERT INTO fact_sales VALUES (11, 1, 2, 3, 1, 70000);
INSERT INTO fact_sales VALUES (12, 2, 3, 1, 1, 100000);