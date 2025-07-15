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


```sql
DECLARE
  v_chunk_size NUMBER := 10000;
  v_rows_deleted NUMBER;
  v_total_rows_deleted NUMBER := 0;
  v_start_time TIMESTAMP;
  v_end_time TIMESTAMP;
  v_last_processed_id NUMBER;
  
  TYPE t_id_list IS TABLE OF audit_audit.id%TYPE INDEX BY PLS_INTEGER;
  v_rows_to_delete_ids t_id_list;

BEGIN
  v_last_processed_id := -2147483648;

  v_start_time := SYSTIMESTAMP;

  LOOP
    SELECT id
    BULK COLLECT INTO v_rows_to_delete_ids
    FROM audit_audit
    WHERE t_source = 'Import'
    AND id > v_last_processed_id
    ORDER BY id
    FETCH FIRST v_chunk_size ROWS ONLY;

    EXIT WHEN v_rows_to_delete_ids.COUNT = 0;

    FORALL i IN 1 .. v_rows_to_delete_ids.COUNT
      DELETE FROM audit_audit WHERE id = v_rows_to_delete_ids(i);
    
    v_rows_deleted := SQL%ROWCOUNT;
    v_total_rows_deleted := v_total_rows_deleted + v_rows_deleted;

    COMMIT;

    v_last_processed_id := v_rows_to_delete_ids(v_rows_to_delete_ids.LAST);

    DBMS_OUTPUT.PUT_LINE('Deleted ' || v_rows_deleted || ' rows. Total: ' || v_total_rows_deleted || ' rows deleted so far.');

  END LOOP;

  v_end_time := SYSTIMESTAMP;

  DBMS_OUTPUT.PUT_LINE('Deletion process completed. Total rows deleted: ' || v_total_rows_deleted || '.');
  DBMS_OUTPUT.PUT_LINE('Total time spent: ' || (v_end_time - v_start_time));

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error during deletion: ' || SQLERRM);
END;
/
```
