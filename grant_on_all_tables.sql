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
