BEGIN
  DBMS_OUTPUT.PUT_LINE('Starting to gather database statistics with 100% estimate...');
  DBMS_STATS.GATHER_DATABASE_STATS(
    estimate_percent => 100,                            -- User requested 100%
    block_sample     => FALSE,                           -- With 100%, block sampling isn't typically used
    method_opt       => 'FOR ALL COLUMNS SIZE AUTO',     -- Default, good for histograms
    degree           => DBMS_STATS.AUTO_DEGREE,          -- Or specify a number e.g., 4
    cascade          => TRUE,                            -- Gather stats for indexes as well
    options          => 'GATHER',                        -- Gather new stats
    no_invalidate    => FALSE                          -- Allow cursors to be invalidated (usually desired)
  );
  DBMS_OUTPUT.PUT_LINE('Database statistics gathering completed.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error gathering database statistics: ' || SQLERRM);
END;
/
