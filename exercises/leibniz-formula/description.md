# Description

Calculate π using [Leibniz formula](https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80).

```
1 - 1/3 + 1/5 - 1/7 + 1/9 - ... = π/4
```

According to [Gottfried Leibniz](https://en.wikipedia.org/wiki/Gottfried_Leibniz), you can calculate π using the formula
above.
The more fractions you use, the closer your calculation will come to π.

Here are some examples:

| number of fractions | calculated π          |
|---------------------|-----------------------|
| 0                   | 4                     |
| 1                   | 2.666666666666666...  |
| 10                  | 3.232315809405594...  |
| 100                 | 3.1514934010709914... |
| 1 000               | 3.1425916543395442... |

Your goal is to create a function that takes the number of fractions as argument, and returns the calculated π using the
formula with the given number of fractions.

## Implementation notes

One adequate solution to this problem is to use [reduction](https://en.wikipedia.org/wiki/Fold_(higher-order_function)), since
every calculation is based on the previous result.