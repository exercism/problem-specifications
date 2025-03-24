# Instructions

Determine whether a number is valid according to the [Luhn formula][luhn].

The number will be provided as a string.

## Validating a number

Strings of length 1 or less are not valid.
Spaces are allowed in the input, but they should be stripped before checking.
All other non-digit characters are disallowed.

### Example 1: valid credit card number

```text
4539 3195 0343 6467
```

The first step of the Luhn algorithm is to double every second digit, starting from the rightmost (last) digit of the number and moving left.

```text
4539 3195 0343 6467
↑ ↑  ↑ ↑  ↑ ↑  ↑ ↑  (double these)
```

If the result of doubling a digit is greater than 9, subtract 9 from that result.
We end up with:

```text
8569 6195 0383 3437
```

Then sum all digits, and if the sum is evenly divisible by 10, the original number is valid.

```text
8 + 5 + 6 + 9 + 6 + 1 + 9 + 5 + 0 + 3 + 8 + 3 + 3 + 4 + 3 + 7 = 80
```

80 is evenly divisible by 10, so number `4539 3195 0343 6467` is valid!

### Example 2: invalid Canadian SIN

```text
066 123 468
```

Double every second digit starting from the rightmost (last) digit of the number and moving left.

```text
066 123 478
 ↑  ↑ ↑  ↑  (double these)
```

If the result of doubling a digit is greater than 9, subtract 9 from that result.
We end up with:

```text
036 226 458
```

Sum the digits:

```text
0 + 3 + 6 + 2 + 2 + 6 + 4 + 5 + 8 = 36
```

36 is not evenly divisible by 10, so number `066 123 478` is not valid!

[luhn]: https://en.wikipedia.org/wiki/Luhn_algorithm
