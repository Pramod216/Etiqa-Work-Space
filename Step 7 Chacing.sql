--Step 7: Caching (Optional)
--You can use caching strategies for frequently accessed data using Oracle's Materialized Views or PL/SQL Collections for data processing.

-- Create a materialized view for caching products
CREATE MATERIALIZED VIEW mv_products_cache
REFRESH FAST ON COMMIT
AS
SELECT * FROM Products;