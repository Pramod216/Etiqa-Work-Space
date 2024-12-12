--Step 6: Scheduling Jobs (Using DBMS_SCHEDULER)
--You can schedule a task to run regularly (e.g., updating prices for books at regular intervals).

BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'UPDATE_BOOK_PRICE_JOB',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN
                            UPDATE Products
                            SET book_price = book_price * 1.05; -- Increase by 5%
                            COMMIT;
                           END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;