## Private-Process Memory Management work_mem and hash_mem_multiplier with sorts - no affect

As per example below, the disc IO is of the same order
* temp read=4963 written=4973 - hash_mem_multiplier 4
*  temp read=4962 written=4970 - hash_mem_multiplier 2


### Details

```
# show work_mem;
 work_mem
----------
 4MB
(1 row)

# show hash_mem_multiplier;
 hash_mem_multiplier
---------------------
 2
(1 row)
```

#### hash_mem_multiplier 4 -t emp read=4963 written=4973
```
# set hash_mem_multiplier = 4;
SET
# EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM perf_row where c00 < 50 order by c50;
                                                              QUERY PLAN
---------------------------------------------------------------------------------------------------------------------------------------
 Gather Merge  (cost=67677.98..72370.17 rows=40216 width=800) (actual time=481.396..519.861 rows=50000 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   Buffers: shared hit=15654 read=40016, temp read=4963 written=4973
   ->  Sort  (cost=66677.96..66728.23 rows=20108 width=800) (actual time=402.314..409.534 rows=16667 loops=3)
         Sort Key: c50
         Sort Method: external merge  Disk: 16552kB
         Buffers: shared hit=15654 read=40016, temp read=4963 written=4973
         Worker 0:  Sort Method: external merge  Disk: 11584kB
         Worker 1:  Sort Method: external merge  Disk: 11568kB
         ->  Parallel Seq Scan on perf_row  (cost=0.00..58160.19 rows=20108 width=800) (actual time=4.001..242.583 rows=16667 loops=3)
               Filter: (c00 < 50)
               Rows Removed by Filter: 150000
               Buffers: shared hit=15540 read=40016
 Planning Time: 0.977 ms
 Execution Time: 522.498 ms
(16 rows)
```
#### hash_mem_multiplier 2 - temp read=4962 written=4970
```
# set hash_mem_multiplier = 2;
SET
# EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM perf_row where c00 < 50 order by c50;
                                                              QUERY PLAN
---------------------------------------------------------------------------------------------------------------------------------------
 Gather Merge  (cost=67677.98..72370.17 rows=40216 width=800) (actual time=359.359..397.040 rows=50000 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   Buffers: shared hit=15667 read=40003, temp read=4962 written=4970
   ->  Sort  (cost=66677.96..66728.23 rows=20108 width=800) (actual time=338.722..343.132 rows=16667 loops=3)
         Sort Key: c50
         Sort Method: external merge  Disk: 14360kB
         Buffers: shared hit=15667 read=40003, temp read=4962 written=4970
         Worker 0:  Sort Method: external merge  Disk: 10016kB
         Worker 1:  Sort Method: external merge  Disk: 15320kB
         ->  Parallel Seq Scan on perf_row  (cost=0.00..58160.19 rows=20108 width=800) (actual time=9.280..214.408 rows=16667 loops=3)
               Filter: (c00 < 50)
               Rows Removed by Filter: 150000
               Buffers: shared hit=15553 read=40003
 Planning Time: 0.755 ms
 Execution Time: 399.936 ms
(16 rows)
```
