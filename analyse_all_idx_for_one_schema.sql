DECLARE
  v_schema_name VARCHAR2(30) := 'YOUR_SCHEMA_NAME'; 
BEGIN
  FOR idx IN (SELECT index_name FROM user_indexes WHERE table_schema = v_schema_name) LOOP
    EXECUTE IMMEDIATE 'ANALYZE INDEX ' || v_schema_name || '.' || idx.index_name || ' VALIDATE STRUCTURE';
  END LOOP;
END;
/
