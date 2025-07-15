DECLARE
  v_rows_deleted NUMBER := 0;
  v_last_id NUMBER; 
BEGIN
  LOOP
    DELETE FROM your_table
    WHERE id IN (
        SELECT id
        FROM ##############
        WHERE <your_condition> 
        ORDER BY id
        FETCH FIRST 10000 ROWS ONLY
    );
    
    v_rows_deleted := SQL%ROWCOUNT;
    COMMIT;
    EXIT WHEN v_rows_deleted = 0;
  END LOOP;
END;
/
