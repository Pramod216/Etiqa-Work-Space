--Step 3: Transaction Management and Bulk Processing
--We'll use a PL/SQL block to demonstrate transaction management, exception handling, and bulk processing. We'll simulate the scenario where a customer buys multiple books.


DECLARE
    -- Variables to handle customer and product details
    v_customer_id Customers.customer_id%TYPE;
    v_product_id Products.product_id%TYPE;
    v_quantity NUMBER;
    v_new_quantity NUMBER;
    v_total_price NUMBER := 0;
BEGIN
    -- Begin transaction
    SAVEPOINT start_transaction;
    
    -- Assign values (simulate a customer purchase)
    v_customer_id := 1;  -- Example customer ID
    v_product_id := 101;  -- Example product ID
    v_quantity := 3;      -- Number of products to buy

    -- Fetch the current product quantity and price
    SELECT book_price, book_quantity INTO v_total_price, v_new_quantity
    FROM Products
    WHERE product_id = v_product_id;

    -- Validate product availability
    IF v_quantity > v_new_quantity THEN
        RAISE_APPLICATION_ERROR(-20001, 'Not enough stock available');
    END IF;

    -- Update product quantity after purchase
    UPDATE Products
    SET book_quantity = book_quantity - v_quantity
    WHERE product_id = v_product_id;

    -- Insert record into Customer_Products to track the purchase
    INSERT INTO Customer_Products (customer_id, product_id, quantity_purchased)
    VALUES (v_customer_id, v_product_id, v_quantity);

    -- Commit transaction if successful
    COMMIT;

EXCEPTION
    -- Handle errors
    WHEN OTHERS THEN
        -- Rollback transaction in case of any errors
        ROLLBACK TO start_transaction;
        -- Log the error for debugging
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;