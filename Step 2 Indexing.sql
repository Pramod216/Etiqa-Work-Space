--To speed up searches, especially when querying by email_office or book_title, you can create indexes.

-- Index for quick lookup of customers by email
CREATE INDEX idx_customers_email_office ON Customers(email_office);

-- Index for quick lookup of products by title
CREATE INDEX idx_products_book_title ON Products(book_title);