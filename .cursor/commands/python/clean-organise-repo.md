# tasks
1. apply ```vulture .``` to check and clean up unused functions with high confidence
2. note - carefully review all the confident functions suggested by vulture; make sure that they are indead unused before cleanup
3. for each result, think of why they are unused - redundant or duplicate implementation?
4. check the repository for long scripts (scripts longer than 250 LOC); we would ideally break them down to utils and components and keep all scripts below 250 LOC
5. report to me on what is the most risk-free and effective cleanup