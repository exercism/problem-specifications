# Introduction

[Pascal's triangle][wikipedia] is a triangular array of positive integers.

Each row has N values, where N is the row number (starting at one).
Therefore, the first row has one value, the second row has two values, and so on.

The values in rows are computed by adding the numbers directly to the right and left of the current position in the previous row.
If the previous row does not have a value to the left or right of the current position, treat that value as zero.

The one exception is the first (topmost) row (as it does not have a previous row) and which contains a single one.

## Example

Let's look at the first 5 rows of Pascal's Triangle:

```text
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
```

[wikipedia]: https://en.wikipedia.org/wiki/Pascal%27s_triangle
