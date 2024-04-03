# Instructions

Convert a number, represented as a sequence of digits in one base, to a sequence of digits in another base.

~~~~exercism/note
Try to implement the conversion yourself.
Do not use something else to perform the conversion for you.
~~~~

## About [Positional Notation][positional-notation]

In positional notation, a number in base **b** can be understood as a linear combination of powers of **b**.

The number 42, _in base 10_, means:

`(4 * 10^1) + (2 * 10^0)`

The number 101010, _in base 2_, means:

`(1 * 2^5) + (0 * 2^4) + (1 * 2^3) + (0 * 2^2) + (1 * 2^1) + (0 * 2^0)`

The number 1120, _in base 3_, means:

`(1 * 3^3) + (1 * 3^2) + (2 * 3^1) + (0 * 3^0)`

_Yes. Those three numbers above are exactly the same. Congratulations!_

[positional-notation]: https://en.wikipedia.org/wiki/Positional_notation
