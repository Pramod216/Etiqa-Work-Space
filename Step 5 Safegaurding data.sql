--Step 5: Safeguarding Sensitive Data (SQL Injection Prevention)
--To protect against SQL Injection, always use bind variables in PL/SQL blocks and avoid directly concatenating user inputs into SQL queries.

DECLARE
    v_email VARCHAR2(100) := :email_input; -- Bind variable for email
BEGIN
    -- Safe query using bind variable
    SELECT customer_id INTO :customer_id
    FROM Customers
    WHERE email_office = v_email;
END;