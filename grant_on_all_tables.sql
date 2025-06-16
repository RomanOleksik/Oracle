SET PAGESIZE 0 LINESIZE 200 FEEDBACK OFF VERIFY OFF
SPOOL grant_privs_from_a_to_b.sql

-- Tables
SELECT 'GRANT SELECT, INSERT, UPDATE, DELETE ON a.' || table_name || ' TO b;'
FROM dba_tables
WHERE owner = 'A';

-- Views
SELECT 'GRANT SELECT, INSERT, UPDATE, DELETE ON a.' || view_name || ' TO b;'
FROM dba_views
WHERE owner = 'A';

SPOOL OFF

-- Version 2

BEGIN
  FOR obj IN (
    SELECT owner, object_name, object_type
    FROM dba_objects
    WHERE owner = 'A' AND object_type IN ('TABLE', 'VIEW')
  ) LOOP
    EXECUTE IMMEDIATE 
      'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || obj.owner || '.' || obj.object_name || ' TO B';
  END LOOP;
END;
/

