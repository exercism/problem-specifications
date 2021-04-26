# Problem Specifications

Shared metadata for Exercism exercises.

## Contributing Guide

Please see the [contributing guide](./CONTRIBUTING.md).

## Exercise Metadata

Each exercise's metadata lives in a directory under `exercises/`.

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

There are three metadata files per exercise:

- `description.md` - the basic problem description
- `metadata.yml` - additional information about the exercise, such as where it came from
- `canonical-data.json` (optional) - standardized test inputs and outputs that can be used to implement the exercise

## Test Data (canonical-data.json)

Test data can be incorporated into a track's test suites manually or extracted by a program (a.k.a. a _test generator_).

- Exercises _must_ contain tests that cover the public interface of the exercise (also thought of as "application tests").
- Exercises _may_ contain tests that cover the private or lower-level interface of the exercise (sometimes refered to as "library tests").

- Test cases are immutable, which means that once a test case has been added, it never changes. There are two exceptions:
  - The `comments` field _can_ be mutated and thus does not require adding a new test case when changing its value.
  - The `description` field _can_ be mutated and thus does not require adding a new test case when changing its value.
  - The `scenarios` field _can_ be mutated additively, by adding new scenarios. Existing scenarios must not be changed or removed. Adding new scenarios thus does not require adding a new test case.
- Test cases _must_ all be considered optional, insomuch that a track should determine per test case whether to implement it or not.
- Each test case has a [UUID (v4)](https://en.wikipedia.org/wiki/Universally_unique_identifier) to uniquely identify it.
- If tracks automatically generate test suites from test data, they _must_ do that based on an explicit list of test cases to include/exclude. Test cases must be identified by their UUID, and we'll provide tooling to help keep track of which test cases to include/exclude.

## Test Data Format

The file format is described in [canonical-schema.json](./canonical-schema.json), but it is easier to understand with an example:

```json
{
  "exercise": "foobar",
  "comments": [
    " Comments are always optional and can be used almost anywhere.      ",
    "                                                                    ",
    " They usually document how the exercise's readme ('description.md') ",
    " is generally interpreted in test programs across different         ",
    " languages.                                                         ",
    "                                                                    ",
    " In addition to a mainstream implementation path, this information  ",
    " can also document significant variations.                          "
  ],
  "cases": [
    {
      "comments": [
        " A test case must have 'uuid', 'description', 'property', ",
        " 'input' and 'expected' properties. The rest is optional. ",
        "                                                          ",
        " The 'property' is a string in lowerCamelCase identifying ",
        " the type of test, but most of the times it is just the   ",
        " name of a function being tested.                         ",
        "                                                          ",
        " Test cases can have any number of additional keys, and   ",
        " most of them also have an 'expected' one, defining the   ",
        " value a test should return.                              "
      ],
      "uuid": "31e9db74-86b9-4b14-a320-9ea910337289",
      "description": "Foo'ing a word returns it reversed",
      "property": "foo",
      "input": {
        "word": "lion"
      },
      "expected": "noil"
    },
    {
      "uuid": "09113ce5-b008-45d0-98af-c0378b64966b",
      "description": "Bar'ing a name returns its parts combined",
      "property": "bar",
      "input": {
        "firstName": "Alan",
        "lastName": "Smithee"
      },
      "expected": "ASlmainthee"
    },
    {
      "comments": [
        " Test cases can be arbitrarily grouped with a description ",
        " to make organization easier.                             "
      ],
      "description": "Abnormal inputs: numbers",
      "cases": [
        {
          "uuid": "f22d7a03-e752-4f14-9231-4eae9f128cef",
          "description": "Foo'ing a number returns nothing",
          "property": "foo",
          "input": {
            "word": "42"
          },
          "expected": null
        },
        {
          "uuid": "8790a635-e8a8-4343-a29f-7da2929b9378",
          "description": "Foo'ing a very big number returns nothing",
          "optional": "big-ints",
          "comments": ["Making this test case pass requires using BigInts."],
          "property": "foo",
          "input": {
            "word": "28948022309329048855892746252171976962977213799489202546401021394546514198529"
          },
          "expected": null,
          "scenarios": ["big-integers"]
        },
        {
          "uuid": "c7b6f24a-553f-475a-8a40-dba854fe1bff",
          "description": "Bar'ing a name with numbers gives an error",
          "property": "bar",
          "input": {
            "firstName": "HAL",
            "lastName": "9000"
          },
          "expected": { "error": "You should never bar a number" }
        }
      ]
    }
  ]
}
```

## Scenarios

An optional field to allow for selectively including/excluding test cases based on a property of the test case (such as using big integers).

- The `scenarios` field can use one or more of a predefined set of values, which are defined in a [`SCENARIOS.txt`](./SCENARIOS.txt) file.
- The `scenarios` field can be mutated additively, by adding new scenarios. Existing scenarios must not be changed or removed. Adding new scenarios does therefore does not mean adding a new test case.
- Library tests should have a `library-test` scenario added to allow for easy including/excluding of library tests. Application tests won't have their own scenario, as they must be included and should not be filtered on.

## Changing Tests

As test cases are immutable, a "bug fix" requires adding a new test case. We'll add metadata to test cases to link a re-implementation of a test case to the re-implemented test case.

- Re-implemented test cases _must_ have a `reimplements` field which contains the UUID of the test case that was re-implemented.
- Re-implemented test cases _must_ use the `comments` field to explain why a test case was re-implemented (e.g. "Expected value is changed to 2").
- Track generators _should not_ automatically select the "latest" version of a test case by looking at the "reimplements" hierarchy. We recommend each track to make this a manual action, as the re-implemented test case might actually make less sense for a track.

This is an example of what a re-implementation looks like:

```json
[
  {
    "uuid": "e46c542b-31fc-4506-bcae-6b62b3268537",
    "description": "two times one is two",
    "property": "twice",
    "input": {
      "number": 1
    },
    "expected": 3
  },
  {
    "uuid": "82d32c2e-07b5-42d9-9b1c-19af72bae860",
    "description": "two times one is two",
    "comments": ["Expected value is changed to 2"],
    "reimplements": "e46c542b-31fc-4506-bcae-6b62b3268537",
    "property": "twice",
    "input": {
      "number": 1
    },
    "expected": 2
  }
]
```

## Track Test Data

If a track implements an exercise for which test data exists, the exercise _must_ contain a `.meta/tests.toml` file. The goal of this file is to keep track of which tests are implemented by the exercise. Tests in this file are identified by their UUID and each test has a boolean value that indicates if it is implemented by that exercise.

A `tests.toml` file for a track's `two-fer` exercise looks like this:

```toml
[canonical-tests]

# no name given
"19709124-b82e-4e86-a722-9e5c5ebf3952" = true

# a name given
"3451eebd-123f-4256-b667-7b109affce32" = true

# another name given
"653611c6-be9f-4935-ab42-978e25fe9a10" = false
```

In this case, the track has chosen to implement two of the three available tests.

If a track uses a _test generator_ to generate an exercise's test suite, it _must_ use the contents of the `tests.toml` file to determine which tests to include in the generated test suite.

### Track Test Data Tooling

To make it easy to keep the `tests.toml` up to date, tracks can use the [`canonical_data_syncer` application](https://github.com/exercism/canonical-data-syncer). This application is a small, standalone binary that will compare the tests specified in the `tests.toml` files against the tests that are defined in the exercise's canonical data. It then interactively gives the maintainer the option to include or exclude test cases that are currently missing, updating the `tests.toml` file accordingly.

To use the canonical data syncer tool, tracks should copying the [`fetch-canonical_data_syncer`](https://github.com/exercism/canonical-data-syncer/blob/main/scripts/fetch-canonical_data_syncer) and/or [`fetch-canonical_data_syncer.ps1`](https://github.com/exercism/canonical-data-syncer/blob/main/scripts/fetch-canonical_data_syncer.ps1) scripts into their repository. Then, running either of these scripts will download the latest version of the tool to the track's `bin` directory. The tool can be run using `./bin/canonical_data_syncer` or `.\bin\canonical_data_syncer.exe`, depending on your operating system.

## Conventions

There are also some conventions that must be followed:

- Descriptions should not simply explain **what** each case is (that is redundant information) but also **why** each case is there. For example, what kinds of implementation mistakes might this case help us find?
- All keys should follow the [lowerCamelCase](http://wiki.c2.com/?LowerCamelCase) convention.
- If the input is valid but there is no result for the input, the value at `"expected"` should be `null`.
- If an error is expected (because the input is invalid, or any other reason), the value at `"expected"` should be an object containing exactly one property, `"error"`, whose value is a string.
  - The string should explain why the error would occur.
  - A particular track's implementation of the exercise **need not** necessarily check that the error includes that exact string as the cause, depending on what is idiomatic in the language (it may not be idiomatic to check strings for error messages).

## Validation

`canonical.json` files can be validated against its schema using https://www.jsonschemavalidator.net/ with...

```
{
"$schema": "https://github.com/exercism/problem-specifications/blob/main/canonical-schema.json"
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

## Github Action Workflows

See [`workflows/README.md`](./workflows/README.md)
