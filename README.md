# x-Common

Shared metadata for Exercism exercises.
The `doc/` subdirectory contains all documentation that is not specific to a language track.

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-common/blob/master/CONTRIBUTING.md)

## Problem metadata

Each problem's data lives in a directory under `exercises/`

```
exercises/
├── accumulate
│   ├── description.md
│   └── metadata.yml
├── ...
├── minesweeper
│   ├── canonical-data.json
│   ├── description.md
│   └── metadata.yml
├── ...
└── zipper
    ├── description.md
    └── metadata.yml
```

There are three metadata files:

* `description.md` - the basic problem description
* `metadata.yml` - additional information about the problem, such as where it came from
* `canonical-data.json` (optional) - standardized test inputs and outputs that can be used to implement the problem

## Test Data Format (canonical-data.json)

This data can be incorporated into test programs manually or extracted by a
program.  The file contains a single JSON object with a key for documentation
and keys for various tests that may be meaningful for a problem.

The documentation uses the key "#" with a list of strings as the value.
These strings document how the problem readme (`description.md`) is generally
interpreted in test programs across different languages.  In addition to a
mainstream implementation path, this information can also document significant
variations.

Each test case has the the following keys:
- description: which will be used to name each generated test
- 'variable names': one or more variable names with values which will be passed to the solution method
- expected: the expected result (this would be -1 when we expect an exception)
- msg: a nice message for the failing case

## Automated Tests

The only thing that we're testing at the moment, is whether or not `canonical-data.json`
is valid json.

If you want to run this before you commit, you will need to install
[jq](https://stedolan.github.io/jq/download/). Then run the script with:

    bin/jsonlint

## License

The MIT License (MIT)

Copyright (c) 2014 Katrina Owen, _@kytrinyx.com
