## Storage Systems

The architecture uses a combination of OLTP, Data Lake, and Data Warehouse systems to support different workloads efficiently. A PostgreSQL-based OLTP system is used to store structured transactional data such as patient records, billing details, and treatment history. This ensures strong consistency and supports day-to-day hospital operations.

A Data Lake (e.g., Amazon S3 or Google Cloud Storage) is used to store raw and unstructured data such as ICU device streams, doctor notes, and logs. This is essential because the system must handle diverse data types including text and real-time streams, which cannot be efficiently stored in traditional relational databases.

A Data Warehouse (e.g., BigQuery or Snowflake) is used for analytical workloads such as monthly reporting on bed occupancy and department-wise costs. Cleaned and transformed data from the lake is loaded into the warehouse to enable fast SQL queries and reporting.

## OLTP vs OLAP Boundary

The OLTP system is responsible for handling real-time transactional operations such as updating patient records and billing information. The OLAP system begins once data is extracted from OLTP and ingested into the Data Lake or Data Warehouse for analysis.

Streaming data from ICU devices bypasses OLTP and is directly ingested into the Data Lake through a streaming platform like Kafka. From there, it is processed in real-time for alert generation and stored for future analysis.

Thus, the boundary lies at the ingestion layer, where operational data is separated from analytical processing pipelines.

## Trade-offs

One significant trade-off in this architecture is increased system complexity due to the use of multiple storage systems (OLTP, Data Lake, and Data Warehouse). While this improves scalability and flexibility, it also increases maintenance overhead and requires careful data synchronization.

To mitigate this, a unified data pipeline with proper orchestration tools (such as Airflow) can be used to automate data movement and ensure consistency across systems. Additionally, schema management and data validation techniques can help maintain data quality.

Despite the complexity, this design ensures scalability, supports real-time and batch processing, and enables advanced AI capabilities, making it suitable for a modern hospital data system.