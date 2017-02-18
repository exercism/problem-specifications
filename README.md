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
program.  The file format is described in `canonical-schema.json`, but it
is easier to understand with a example:

```json
{ "exercise": "foobar"
, "version" : "1.0.0"
, "comments":
    [ " Comments are always optional and can be used almost anywhere.      "
    , "                                                                    "
    , " They usually document how the exercise's readme ('description.md') "
    , " is generally interpreted in test programs across different         "
    , " languages.                                                         "
    , "                                                                    "
    , " In addition to a mainstream implementation path, this information  "
    , " can also document significant variations.                          "
    ]
, "cases":
    [ { "comments":
          [ " A test case must have a 'description' and a 'property'.  "
          , " Anything else is optional.                               "
          , "                                                          "
          , " The 'property' is a string in lowerCamelCase identifying "
          , " the type of test, but most of the times it is just the   "
          , " name of a function being tested.                         "
          , "                                                          "
          , " Test cases can have any number of additional keys, and   "
          , " most of them also have an 'expected' one, defining the   "
          , " value a test should return.                              "
          ]
      , "description": "Foo'ing a word returns it reversed"
      , "property"   : "foo"
      , "input"      : "lion"
      , "expected"   : "noil"
      }
    , { "description": "Bar'ing a name returns its parts combined"
      , "property"   : "bar"
      , "firstName"  : "Alan"
      , "lastName"   : "Smithee"
      , "expected"   : "ASlmainthee"
      }
    , { "comments":
          [ " Test cases can be arbitrarily grouped with a description "
          , " to make organization easier.                             "
          ]
      , "description": "Abnormal inputs: numbers"
      , "cases":
          [ { "description": "Foo'ing a number returns nothing"
            , "property"   : "foo"
            , "input"      : "42"
            , "expected"   : null
            }
          , { "description": "Bar'ing a name with numbers gives an error"
            , "property"   : "bar"
            , "firstName"  : "HAL"
            , "lastName"   : "9000"
            , "expected"   : { "error": "You should never bar a number" }
            }
          ]
      }
  ]
}

```

Keep in mind that the description should not simply explain **what** each case
is (that is redundant information) but also **why** each case is there. For
example, what kinds of implementation mistakes might this case help us find?

There are also some convention about `expected` that you must follow:

  - if the input is valid but there is no result for the input, the value at `"expected"` should be `null`.
  - if an error is expected (because the input is invalid, or any other reason), the value at `"expected"` should be an object containing exactly one property, `"error"`, whose value is a string.
    - The string should explain why the error would occur.
    - A particular track's implementation of the exercise **need not** necessarily check that the error includes that exact string as the cause, depending on what is idiomatic in the language (it may not be idiomatic to check strings for error messages).

## Automated Tests

The only thing that we're testing at the moment, is whether or not `canonical-data.json`
is valid json.

If you want to run this before you commit, you will need to install
[jq](https://stedolan.github.io/jq/download/). Then run the script with:

    bin/jsonlint

## License

The MIT License (MIT)

Copyright (c) 2014 Katrina Owen, _@kytrinyx.com
