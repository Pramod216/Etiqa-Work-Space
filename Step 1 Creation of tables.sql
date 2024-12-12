CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email_office VARCHAR2(100) UNIQUE,
    email_personal VARCHAR2(100) UNIQUE,
    family_members NUMBER
);

-- Create the Products table
CREATE TABLE Products (
    product_id NUMBER PRIMARY KEY,
    book_title VARCHAR2(200) NOT NULL,
    book_price NUMBER(10, 2) CHECK (book_price >= 0),
    book_quantity NUMBER DEFAULT 0 CHECK (book_quantity >= 0)
);

-- Create a relationship table between Customers and Products (Many-to-Many)
CREATE TABLE Customer_Products (
    customer_id NUMBER,
    product_id NUMBER,
    quantity_purchased NUMBER,
    PRIMARY KEY (customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);