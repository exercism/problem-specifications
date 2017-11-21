Given a number, check if a given ISBN-10 is valid.

The [ISBN-10 verification process](http://www.hahnlibrary.net/libraries/isbncalc.html) requires use of a simple formula, and is mostly used to validate book identification
numbers.

## Functionality

Given an unknown string the program should check if the provided string is a valid ISBN-10.
Putting this into place requires some thinking about preprocessing/parsing of the string prior to calculating the check digit for the ISBN.

The program should allow for ISBN-10 without the separating dashes to be verified as well.

## ISBN

The ISBN-10 format is 9 digits (0 to 9) plus one check character (either a digit or an X only). In the case the check character is an X, this represents the value '10'. These may be communicated with or without hyphens, and can be checked for their validity by the following formula:

```
(x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10 * 1) mod 11 == 0
```

If the result is 0, then it is a valid ISBN-10, otherwise it is invalid.

## Example

Let's take a random ISBN-10 number, for instance `3-598-21508-8`.
The first digit block indicates the group where the ISBN belongs. Groups can consist of shared languages, geographic regions or countries. The leading '3' signals this ISBN is from a german speaking country.
The following number block is to identify the publisher. Since this is a three digit publisher number there is a 5 digit title number for this book.
The last digit in the ISBN is the check digit which is used to detect read errors.

So for our example ISBN this means:
```
(3 * 10 + 5 * 9 + 9 * 8 + 8 * 7 + 2 * 6 + 1 * 5 + 5 * 4 + 0 * 3 + 8 * 2 + 8 * 1) mod 11 = 0
```

Since the result is 0, this proves that our ISBN is valid.

## Caveats

Converting from strings to numbers can be tricky in certain languages.
Now, it's even trickier since the check digit of an ISBN-10 may be 'X' (representative of '10').

## Bonus tasks

* Generate a valid ISBN-13 from the input ISBN-10 (and maybe verify it again with a derived verifier).

* Generate valid ISBN, maybe even from a given starting ISBN.