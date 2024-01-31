# Description

The Romans were a clever bunch.
They conquered most of Europe and ruled it for hundreds of years.
They invented concrete and straight roads and even central heating.
But one thing they never discovered though was the number zero.

Their numbering system, known today as "Roman Numerals" uses letters - I, V, X, L, C, D, M.

| I | V | X  | L  |  C  |  D  |  M   |
|---|---|----|----|-----|-----|------|
| 1 | 5 | 10 | 50 | 100 | 500 | 1000 |

There are four basic rules for Roman Numerals:

- When a larger letter precedes a smaller letter, the letters are added together. For example: in `VI`, `V` (5) is larger than `I` (1), so we add them together to get 6.
- When a smaller letter precedes a larger letter, the letters are subtracted. For example: in `IV`, `I` (1) is smaller than `V` (5), so we subtract 1 from 5 to get 4.
- When a letter is repeated multiple times, they get added. For example: with `XX` we add X (10) to X (10), to get 20.
- The same letter cannot be used more than three times in succession.

It is also normal to use a single letter if possible, so for example, you'd choose `X` (10) rather than `VV` (5 + 5).

## Examples

In Roman numerals 1990 is MCMXC:

```text
 1000 => M
+ 900 => CM
+  90 => XC
----- => -----
 1990 => MCMXC
```

MCMLXXVIII is 1978:

```text
          M => 1000
         CM =>  900 (1000 - 100)
+   LXXVIII =>   78 (50 + 10 + 10 + 5 + 1 + 1 + 1)
---------  => ----
 MCMLXXVIII => 1978
```
