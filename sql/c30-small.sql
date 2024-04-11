\set sleep_ms random(1, 20000)
\sleep :sleep_ms  ms
EXPLAIN (ANALYZE, BUFFERS) SELECT c30, SUM(c29), AVG(c71) FROM perf_row GROUP BY c30;
