# problem-specifications

Shared metadata for Exercism exercises.

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/problem-specifications/blob/master/CONTRIBUTING.md)

## Problem metadata

Each problem's data lives in a directory under `exercises/`

```text
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
* `canonical-data.json` - standardized test inputs and outputs that can be used to implement the problem

## Test Data Format (canonical-data.json)

This data can be incorporated into test programs manually or extracted by a
program.  The file format is described in [canonical-schema.json](https://github.com/exercism/problem-specifications/blob/master/canonical-schema.json), but it
is easier to understand with an example:

```json
{ "exercise": "foobar"
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
          [ " A test case must have 'uuid', 'description', 'property', "
          , " 'input' and 'expected' properties. The rest is optional. "
          , "                                                          "
          , " The 'property' is a string in lowerCamelCase identifying "
          , " the type of test, but most of the times it is just the   "
          , " name of a function being tested.                         "
          , "                                                          "
          , " Test cases can have any number of additional keys, and   "
          , " most of them also have an 'expected' one, defining the   "
          , " value a test should return.                              "
          ]
      , "uuid"       : "31e9db74-86b9-4b14-a320-9ea910337289"
      , "description": "Foo'ing a word returns it reversed"
      , "property"   : "foo"
      , "input"      : {
          "word"       : "lion"
        }
      , "expected"   : "noil"
      }
    , { "uuid"       : "09113ce5-b008-45d0-98af-c0378b64966b"
      , "description": "Bar'ing a name returns its parts combined"
      , "property"   : "bar"
      , "input"      : {
          "firstName"  : "Alan",
          "lastName"   : "Smithee"
        }
      , "expected"   : "ASlmainthee"
      }
    , { "comments":
          [ " Test cases can be arbitrarily grouped with a description "
          , " to make organization easier.                             "
          ]
      , "description": "Abnormal inputs: numbers"
      , "cases":
          [ { "uuid"       : "f22d7a03-e752-4f14-9231-4eae9f128cef"
            , "description": "Foo'ing a number returns nothing"
            , "property"   : "foo"
            , "input"      : {
                "word"       : "42"
              }
            , "expected"   : null
            }
          , { "uuid"       : "8790a635-e8a8-4343-a29f-7da2929b9378"
            , "description": "Foo'ing a very big number returns nothing"            
            , "scenarios"  : ["big-ints"]
            , "comments"   : [ "Making this test case pass requires using BigInts." ]
            , "property"   : "foo"
            , "input"      : {
                "word"       : "28948022309329048855892746252171976962977213799489202546401021394546514198529"
              }
            , "expected"   : null
            }
          , { "uuid"       : "c7b6f24a-553f-475a-8a40-dba854fe1bff"
            , "description": "Bar'ing a name with numbers gives an error"
            , "property"   : "bar"
            , "input"      : {
                "firstName"  : "HAL",
                "lastName"   : "9000"
              }
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

There are also some conventions that must be followed:

  - All keys should follow the [lowerCamelCase](http://wiki.c2.com/?LowerCamelCase) convention.
  - If the input is valid but there is no result for the input, the value at `"expected"` should be `null`.
  - If an error is expected (because the input is invalid, or any other reason), the value at `"expected"` should be an object containing exactly one property, `"error"`, whose value is a string.
    - The string should explain why the error would occur.
    - A particular track's implementation of the exercise **need not** necessarily check that the error includes that exact string as the cause, depending on what is idiomatic in the language (it may not be idiomatic to check strings for error messages).
  - The [`SCENARIOS.txt`](./SCENARIOS.txt) file contains a set of scenarios. If one or more of these scenarios apply to a test case, they should be included in its `scenarios` field.
  - Each test case must have a unique UUID specified in its `"uuid"` key. A UUID can be randomly generated using the [UUID Generator](https://www.uuidgenerator.net/version4).

The `canonical.json` file can be validated against its schema prior to commiting using https://www.jsonschemavalidator.net/ with...
```
{
	"$schema": "https://github.com/exercism/problem-specifications/blob/master/canonical-schema.json"
}
```

## New Exercises Require a Glyph

When creating a new exercise the design team needs to be informed so that a new glyph can be created.
- An issue should be opened in [exercism/website-icons](https://github.com/exercism/website-icons/issues) after a PR has been opened in problem-specifications.
- This issue should reference the PR in problem-specifications.

## Automated Tests

`canonical-data.json` for each exercise is checked for compliance against the [canonical-schema.json](canonical-schema.json).
In order to run these tests, you will need to have `yarn` installed on your system.
Install them from [here](https://yarnpkg.com/en/docs/install).

Install the required packages:

```shell
yarn install
```

Run for all exercises:

```shell
yarn test
```

Run for single exercise:

```shell
yarn run test-one exercises/<exercise>/canonical-data.json
```

Replace `<exercise>` by the name of exercise which you want to check.
