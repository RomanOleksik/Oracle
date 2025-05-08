#!/bin/bash

LOG_DIR="$ORACLE_BASE/cfgtoollogs/sqlpatch"
DAYS_RETENTION=90  # Keep logs for 90 days

echo "Cleaning SQLPatch logs older than $DAYS_RETENTION days in $LOG_DIR"

find "$LOG_DIR" -type f -mtime +$DAYS_RETENTION -exec rm -f {} \;

echo "Cleanup completed."
