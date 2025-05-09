#!/bin/bash
# Set environment
export ORACLE_HOME=/path/to/oracle_home
export PATH=$ORACLE_HOME/bin:$PATH

# Purge older than 7 days (168 hours)
AGE=168

# Loop through all ADR homes and purge individually
for adr_home in $(adrci exec="show homes" | grep -E '^diag'); do
  echo "Purging ADR Home: ${adr_home}"
  adrci exec="set home ${adr_home}; purge -age ${AGE} -type TRACE"
  adrci exec="set home ${adr_home}; purge -age ${AGE} -type ALERT"
  adrci exec="set home ${adr_home}; purge -age ${AGE} -type INCIDENT"
  adrci exec="set home ${adr_home}; purge -age ${AGE} -type CDUMP"
done
