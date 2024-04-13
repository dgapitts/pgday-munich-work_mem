# pg-day Munich - work_mem demos

## Intro
Postgres work_mem and private memory management is an important topic but not often discussed in depth at postgres events?
I'm presenting at pgDay DE (Munich) 2024 on this topic in-depth and would like to focus on just

(a) the recent hash_mem_multiplier changes affecting anyone upgrading to pg15 or pg16 and

(b) some of the extra challenges DBaaS users have

(c) tuning using heuristics (PGTune) vs ML (DBtune)



## Demos 
* [Demo01 - Private Process Memory Management -  work_mem and hash_mem_multiplier woth HashAggregate operation - saves disc io](docs/Demo01-Private-Process-Memory-Management-work_mem-and-hash_mem_multiplier.md)
* [Demo02 - Private-Process Memory Management work_mem and hash_mem_multiplier with Sort operations - no affect](docs/Demo02-Private-Process-Memory-Management-work_mem-and-hash_mem_multiplier-with-sorts.md)
* [Demo03 - pgbench custom scripts for high concurrent HashAggregate operation - exhaust CPU and memory usage is not significantly impacted](docs/Demo03-pgbench-custom-scripts-for-high-concurrent-HashAggregate-operation.md)
* [Demo04 - DBtune test results and jupyter based analysis](docs/Demo04-DBtune-test-results-and-jupyter-based-analysis.md)
* [Demo05 - Edge Cases run away dynamic SQL](docs/Demo05-Edge-Cases-run-away-dynamic-SQL.md)
<<<<<<< HEAD
=======


## Q&A

Some nice feedback and Q&A
* I need to cover an edge where a long-running process can have a high memory footprint when idle ... going to try demo-ing this (todo list)
* Regarding DB tune could we (a) add bounds and (b) should we add hash_mem_multiplier as a parameter ... good questions for DBtune team (@luigi)

## Slides

* [DB_Memory_Management-work_mem-pgDay_Munich_2024.pdf](docs/DB_Memory_Management-work_mem-pgDay_Munich_2024.pdf) (2.5Mb)
>>>>>>> b3b3003 (add-some-feedback-and-slides)
