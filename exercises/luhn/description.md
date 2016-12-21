The [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) is
a simple checksum formula used to validate a variety of identification
numbers, such as credit card numbers and Canadian Social Insurance
Numbers.

Validating a Number
------

As an example, here is a valid (but fictitious) Canadian Social Insurance
Number.

```
046 454 286
```

The first step of the Luhn algorithm is to double every second digit,
starting from the right. We will be doubling

```
_4_ 4_4 _8_
```

If doubling the number results in a number greater than 9 then subtract 9
from the product. The results of our doubling:

```
086 858 276
```

Then sum all of the digits

```
0+8+6+8+5+8+2+7+6 = 50
```

If the sum is evenly divisible by 10, then the number is valid. This number is valid!

An example of an invalid Canadian SIN where we've changed the final digit

```
046 454 287
```

Double the second digits, starting from the right

```
086 858 276
```

Sum the digits

```
0+8+6+8+5+8+2+7+7 = 51
```

51 is not evenly divisible by 10, so this number is not valid.

----

An example of an invalid credit card account

```
8273 1232 7352 0569
```

Double the second digits, starting from the right

```
7253 2262 5312 0539
```

Sum the digits

```
7+2+5+3+2+2+5+2+5+3+1+2+0+5+3+9 = 57
```

57 is not evenly divisible by 10, so this number is not valid.

Generating a Check Digit
----

The final number in these examples is called to a [check digit](https://en.wikipedia.org/wiki/Check_digit).

```
 046 454 28   6
| account |   |check digit|
```

```
8273 1232 7352 056   9
|    account     |   |check digit|
```

Given an account number your code should be able to return a check digit
that can be appended to the account to generate a valid Luhn

Generate a correct check digit for our Canadian SIN account number

```
Luhn.generate_check_digit("046 454 28")
#=> 6
#=> 045 456 286 is valid
```

Generate a correct check digit for our credit card account

```
Luhn.generate_check_digit("8273 1232 7352 056")
#=> 2
#=> 8273 1232 7352 0562 is valid
```
