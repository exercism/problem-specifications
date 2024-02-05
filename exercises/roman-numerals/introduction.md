# Description

Today, most people in the world use Arabic numbers.
But if you travelled back two thousand years, you'd find a most cultures in Europe were using Roman numerals instead.

To write a Roman numeral we use the following Latin letters, each of which has a value:

| M    | D   | C   | L  | X  | V | I |
|------|-----|-----|----|----|---|---|
| 1000 | 500 | 100 | 50 | 10 | 5 | 1 |

A Roman numeral is a sequence of these letters, and its value is the sum of the values of its letters.
For example, `XVIII` has the value 18 (`10 + 5 + 1 + 1 + 1 = 18`).

There's one rule that makes things tricker though, and that's that **the same letter cannot be used more than three times in succession**.
That means that we can't express numbers such as 4 using the seamingly natural method of `IIII`.
Instead, for those numbers, we use a subtraction method, where we represent 5 not by `1 + 1 + 1 + 1` but instead by `4 - 1`.
And slightly confusingly to our modern thinking, we write the smaller number first.
This applies in the following cases: 4 (`IV`), 9 (`IX`), 40 (`XL`), 90 (`XC`), 400 (`CD`) or 900 (`CM`).

Order matters in Roman numerals.
Letters (and the special compounds above) must be ordered by decreasing value from left to right.

Here are some examples:

```text
 100 => C
+  5 => V
---- => --
 105 => CV
```

```text
 100 => C
+  5 => V
+  1 => I
---- => --
 106 => CVI
```

```text
 100 => C
+  4 => IV
---- => --i
 104 => CIV
```

And a final more complex example:

```text
 1000 => M
  900 => CM
   90 => XC
    5 => V
+   1 => I
----- => -----
 1996 => MCMXCVI
```
