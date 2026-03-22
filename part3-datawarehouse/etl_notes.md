## ETL Decisions

### Decision 1 – Date Standardization
Problem: Raw data had multiple date formats.
Resolution: Converted all dates into YYYY-MM-DD format.

### Decision 2 – Handling NULL Values
Problem: Some fields had NULL values.
Resolution: Replaced NULL sales with 0 and categories with 'Unknown'.

### Decision 3 – Category Normalization
Problem: Categories had inconsistent casing.
Resolution: Standardized all category names.