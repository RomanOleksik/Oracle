SET LINESIZE 150
SET PAGESIZE 2000
SELECT * 
FROM table(DBMS_XPLAN.DISPLAY_CURSOR(sql_id => '<your_sql_id>', format => 'ALL +OUTLINE'));
