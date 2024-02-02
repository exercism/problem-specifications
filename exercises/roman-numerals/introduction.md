# Description

Today, most of the world use Arabic numbers.
But if you go back two thousand years, a large proportion of Europe were using Roman numerals instead.

Roman numerals used letters from the Latin alphabet (I, V, X, L, C, D, M) to represent numbers, and rather than having digits of 0 to 10 like modern Arabic numbers, they had numerals representing numbers starting with 1 and 5.

| I | V | X  | L  |  C  |  D  |  M   |
|---|---|----|----|-----|-----|------|
| 1 | 5 | 10 | 50 | 100 | 500 | 1000 |

To read Roman numerals you need to know a few basic rules.

- We read from left-to-right.
- When a letter is repeated multiple times (e.g. `XX`), they get added: `XX(20) = X(10) + X(10)`
- The same letter cannot be used more than three times in succession (e.g. `IIII` is invalid - instead you would write `IV`).
- When a larger letter precedes a smaller letter (e.g. `VI`), letters are added together: `VI(6) = (5) + I(1)`
- When a smaller letter precedes a larger letter (e.g. `IV`), the first letter is subtracted from the second: `IV(4) = V(5) - I(1)`
- When subtracing, we cannot have more than one number being subtracted (e.g. `IIV` is invalid) and we can only subtract the nearest two letters (e.g. `IV` and `IX` are valid, but `IL` is not)
- Use a single letter if possible, (e.g. `VV` is invalid - use `X` instead).

To look at a complete example, in Roman numerals 1996 is MCMXCVI:

```text
 1000 => M
  900 => CM
   90 => XC
+   6 => VI
----- => -----
 1996 => MCMXCVI
```
