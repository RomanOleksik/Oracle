SELECT sql_id, executions, cpu_time, elapsed_time, disk_reads, disk_writes
FROM v$sql
ORDER BY executions DESC
FETCH FIRST 10 ROWS ONLY;
