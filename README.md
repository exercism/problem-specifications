# x-Common

Shared metadata for Exercism exercises.

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

## Test Data Format

Each problem can have a file &lt;problem>.json containing standard test data.
This data can be incoporated into test programs manually or extracted by a
program.  The file contains a single JSON object with a key for documentation
and keys for various tests that may be meaningful for a problem.

The documentation uses the key "#" with a list of strings as the value.
These strings document how the problem readme (&lt;problem>.md) is generally
interpreted in test programs across different languages.  In addition to a
mainstream implementation path, this information can also document significant
variations.

Each test uses a key name representative of the test and an object as the
value.  This object has two keys, "Description" and "Cases".  Description has
a list of strings as its value.  Cases has a list of objects as its value.
Each case object represents a separate test case.  A case object should have
a description field and fields for inputs and outputs.  A test case description should be a short phrase, suitable to be included in an error message.

## License

The MIT License (MIT)

Copyright (c) 2014 Katrina Owen, _@kytrinyx.com
