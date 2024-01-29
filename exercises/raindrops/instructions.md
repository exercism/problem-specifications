# Instructions

Your task is to convert a number into a string that contains corresponding raindrop sounds, based on the number's factors.

The rules of `raindrops` are that if a given number:

- has 3 as a factor, add 'Pling' to the result.
- has 5 as a factor, add 'Plang' to the result.
- has 7 as a factor, add 'Plong' to the result.
- **does not** have any of 3, 5, or 7 as a factor, the result should be the digits of the number.

~~~~exercism/note
In case your maths is rusty, a factor is a number that evenly divides into another number, leaving no remainder.
For example, 10 has 1, 2, 5 and 10 as its factors.
The simplest way to test if one number is a factor of another is to use the [modulo operation][modulo].

[modulo]: https://en.wikipedia.org/wiki/Modulo_operation
~~~~

## Examples

- 28 has 7 as a factor, but not 3 or 5, so the result would be `"Plong"`.
- 30 has both 3 and 5 as factors, but not 7, so the result would be `"PlingPlang"`.
- 34 is not factored by 3, 5, or 7, so the result would be `"34"`.
