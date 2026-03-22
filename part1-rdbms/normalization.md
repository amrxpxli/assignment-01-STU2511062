## Anomaly Analysis
Insert Anomaly

In the orders_flat.csv dataset, product, customer, and sales representative details are stored together with order information in a single table. This creates an insertion anomaly because independent data cannot be inserted without related data.

For example, product details such as product_id, product_name, category, and unit_price appear only in rows where an order exists. Consider a product like product_id = P101, which appears in multiple rows (e.g., rows 5, 12, and 18). If a new product (e.g., P200) needs to be added to the system but has not yet been ordered, it cannot be inserted without also providing values for unrelated attributes such as order_id, customer_id, and sales_rep_id.

Thus, the design forces the insertion of unnecessary or dummy data, demonstrating an insert anomaly.

Update Anomaly

The dataset contains repeated information for products, customers, and sales representatives across multiple rows, leading to redundancy and potential inconsistency.

For instance, the unit_price of a product such as product_id = P101 is repeated in several rows (e.g., rows 5, 12, and 18). If the price of this product changes, the update must be applied to all corresponding rows. If even one row is missed during the update, it results in inconsistent data, where the same product has different prices in different records.

Similarly, customer details like customer_name and customer_city and sales representative details like sales_rep_name are also repeated across multiple rows.

Therefore, maintaining consistency becomes difficult, resulting in an update anomaly.

Delete Anomaly

The structure of the dataset can lead to unintended loss of important information when deleting records.

For example, if a row representing an order is deleted and that row is the only instance of a particular product (e.g., product_id = P105), then all information about that product—such as product_name, category, and unit_price—is also lost. This means the system loses product details simply because an order was removed.

Similarly, if the only order associated with a customer (e.g., customer_id = C010) is deleted, all information about that customer is also removed from the dataset.

Thus, deleting a single record can result in the loss of multiple types of data, demonstrating a delete anomaly.



## Normalization Justification

Keeping all data in a single table may appear simple initially, but in the given dataset (orders_flat.csv), it leads to significant redundancy and multiple anomalies. For example, product details such as product_name, category, and unit_price are repeated across many rows for every order in which the product appears. If the price of a product like P007 (Pen Set) changes, it must be updated in multiple rows. Missing even one update would result in inconsistent data, demonstrating an update anomaly.

Similarly, customer information such as customer_name and customer_city is duplicated across several orders. This increases storage unnecessarily and makes maintenance difficult. Insertion is also problematic: a new product or sales representative cannot be added unless an order exists, forcing the use of incomplete or dummy data. This clearly shows an insertion anomaly.

Deletion poses another risk. If the only order containing a product such as P005 (Headphones) is removed, all information about that product is lost. Likewise, deleting the last order of a customer removes all their details, leading to unintended data loss.

Normalization addresses these issues by separating data into logically independent tables such as Customers, Products, Orders, Sales Representatives, and Order Details. This eliminates redundancy, ensures consistency, and allows independent insertion, updating, and deletion of data. Therefore, normalization is not over-engineering but a necessary practice for building efficient, scalable, and reliable database systems.