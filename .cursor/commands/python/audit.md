# tasks
- check the current or the provided repository for code standard
- try cover all the dirs and sub-dirs

# tools
- please apply the following tools
- `ruff` for linting and format; report all the issues
- apply `vulture` to make sure that files not exceed 250 LOC; report all the instances

# standards (personal)
- avoid "try and except" blocks, these are monkey patches, we want to find the true cause and expose the errors; report all the unnecessary try blocks
- always expose the issue and true to find the true fix, do not use monkey patch to hide any problems
- prefer Path from pathlib over os for path management
- report all the local path cases that prevents the projects from running across machines (unless it is explicitly set as configs)
- prefer OOP, everything is a class; at least avoid long spaghetti FOP
- prefer match case syntax over "if elif" where approperiate (not universal)
- for all classes and functions, keep a single or few lines concise docstring
- lowercase initials for all sentences and docstrings! for cases like this feel free to change directly
- no excessive incline comments starting #, if you see any, remove them
- do NOT use loop in side of a loop
- do not use "raise"s

# correctness
- check for obvious errors and rediculous mistakes that will cause the project to run in unexpected ways; report if any
- check for obvious errors that will waste system resources; report if any
- check for mistakes around code design and overall structure; make sure the overall design is cohere and as intended