-- Enable echo to show commands as they are executed
SET ECHO OFF;

-- Disable feedback to avoid extra output like "3 rows selected."
SET FEEDBACK OFF;

-- Set line size for better readability of wide outputs
SET LINESIZE 250;

-- Set page size to control the number of rows per page
SET PAGESIZE 50000;

-- Suppress headers for cleaner output
-- SET HEADING ON;

-- Set the display width for numeric columns
SET NUMWIDTH 16;

-- Display all rows in a single output without pauses
SET PAUSE OFF;

-- Disable wrapping of text for long lines
SET WRAP OFF;

-- Set column output format to prevent truncation
SET LONG 10000; -- For long object descriptions (e.g., PL/SQL code)
SET LONGCHUNKSIZE 5000; -- Control the chunk size for LONG values

-- Enable timing to measure query execution time
SET TIMING ON;

-- Display the current date and time in the output
SET TERMOUT ON;

-- Automatically display execution plan statistics for queries
-- SET AUTOTRACE ON

-- Display all server output (useful for PL/SQL scripts)
SET SERVEROUTPUT ON SIZE UNLIMITED;

-- Show error stack for better debugging
SET SQLPROMPT "_USER'@'_CONNECT_IDENTIFIER._CON_NAME> ";
SHOW ERRORS;

-- Show PDBs
show pdbs;

-- Add a comment to indicate end of the setup
PROMPT Custom parameters for sqlplus has been set
