Check if a given ISBN-10 is valid.

## Functionality

Given an unkown string the program should check if the provided string is a valid ISBN-10.
Putting this into place requires some thinking about preprocessing/parsing of the string prior to calculating the check digit for the ISBN.

The program should allow for ISBN-10 without the separating dashes to be verified as well.

## Caveats

Converting from string to number can be tricky in certain languages.
It's getting even trickier since the check-digit of an ISBN-10 can be 'X'.

## Bonus tasks

* Generate an valid ISBN-13 from the input ISBN-10 (and maybe verify it again with an derived verifier)

* Generate valid ISBN, maybe even from a given starting ISBN