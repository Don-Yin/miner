# for js repositories
1. apply ```npx knip``` to check for unused code and dependencies
2. do a careful examination on each instances to make sure that they are truely unused
3. think of why they are unused - redundant or duplicate implementation?
4. check the repository for long scripts (scripts longer than 250 LOC); we would ideally break them down to utils and components and keep all scripts below 250 LOC
5. report to me on what is the most risk-free and effective cleanup