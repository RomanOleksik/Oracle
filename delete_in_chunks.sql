DECLARE
  -- Set the desired chunk size (number of rows to delete per transaction)
  v_chunk_size NUMBER := 10000;
  
  -- Variable to track the number of rows deleted in the last iteration
  v_rows_deleted NUMBER; 
BEGIN
  -- Start the loop
  LOOP
    -- Delete a chunk of rows based on your criteria
    DELETE FROM your_table
    WHERE <your_condition> -- Replace with your specific criteria (e.g., date, ID range)
    AND ROWNUM <= v_chunk_size;
    
    -- Get the number of rows affected by the last DELETE statement
    v_rows_deleted := SQL%ROWCOUNT;
    
    -- Commit the transaction for the current chunk
    COMMIT;
    
    -- Print a message to show the progress
    DBMS_OUTPUT.PUT_LINE('Deleted ' || v_rows_deleted || ' rows.');
    
    -- Exit the loop if no rows were deleted in the last iteration
    EXIT WHEN v_rows_deleted = 0;
    
    -- Optional: Add a delay to reduce system load during the deletion process
    -- DBMS_LOCK.SLEEP(1); -- Sleep for 1 second
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('Deletion process completed.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK; -- Rollback if an error occurs
    DBMS_OUTPUT.PUT_LINE('Error during deletion: ' || SQLERRM);
END;
/
