--Step 4: Field Validation & Exception Handling
--Email Validation:
--Inserting a customer with invalid email format would be handled with triggers or validation functions.


CREATE OR REPLACE FUNCTION validate_email(p_email IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
    IF NOT REGEXP_LIKE(p_email, '^[\w\.]+@\w+\.\w{2,}$') THEN
        RETURN FALSE;
    END IF;
    RETURN TRUE;
END validate_email;
--This function could be used in a trigger to validate emails before inserting or updating records.