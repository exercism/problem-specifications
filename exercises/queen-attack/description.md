# Description

Given the position of two queens on a chess board, indicate whether or not they are positioned so that they can attack each other.

In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal.

A chessboard can be represented by an 8 by 8 array.

So if you are told the white queen is at `c5` (zero-indexed at column 2, row 3) and the black queen at `f2` (zero-indexed at column 5, row 6), then you know that the set-up is like so:

```text
  a b c d e f g h       a b c d e f g h       a b c d e f g h
8 _ _ _ _ _ _ _ _ 8   8 _ _ _ _ _ _ _ _ 1   8 _ _ _ _ _ _ _ _ 8
7 _ _ _ _ _ _ _ _ 7   7 _ _ _ _ _ _ _ _ 2   7 _ _ _ W _ _ _ _ 7
6 _ _ _ W _ _ _ _ 6   6 _ B _ _ _ W _ _ 3   6 _ _ _ _ _ _ _ _ 6
5 _ _ _ _ _ _ _ _ 5   5 _ _ _ _ _ _ _ _ 4   5 _ _ _ _ _ _ _ _ 5
4 _ _ _ _ _ _ _ _ 4   4 _ _ _ _ _ _ _ _ 5   4 _ _ _ _ _ _ _ _ 4
3 _ _ _ _ _ _ B _ 3   3 _ _ _ _ _ _ _ _ 6   3 _ _ _ _ _ _ _ _ 3
2 _ _ _ _ _ _ _ _ 2   2 _ _ _ _ _ _ _ _ 7   2 _ _ _ B _ _ _ _ 2
1 _ _ _ _ _ _ _ _ 1   1 _ _ _ _ _ _ _ _ 8   1 _ _ _ _ _ _ _ _ 1
  a b c d e f g h      a b c d e f g h        a b c d e f g h
```
```

You are also be able to answer whether the queens can attack each other.
In this case, that answer would be yes; they can, because both pieces share a diagonal, row, or column.


### Examples of queens not interacting:

```text
  a b c d e f g h       a b c d e f g h       a b c d e f g h
8 _ _ _ _ _ _ _ _ 8   8 _ _ _ _ _ _ _ _ 8   8 _ _ _ _ _ _ _ _ 8
7 _ _ _ _ _ _ _ _ 7   7 _ _ _ _ _ _ _ _ 7   7 _ _ _ W _ _ _ _ 7
6 _ _ _ _ _ _ _ _ 6   6 _ _ _ _ _ W _ _ 6   6 _ _ _ _ _ _ _ _ 6
5 _ _ _ _ _ _ _ _ 5   5 _ _ _ _ _ _ _ _ 5   5 _ _ _ _ _ _ _ _ 5
4 _ _ _ _ W _ _ _ 4   4 _ _ _ _ _ _ _ _ 4   4 _ _ _ _ _ _ _ _ 4
3 _ _ _ _ _ _ B _ 3   3 _ _ _ _ _ _ _ _ 3   3 _ _ _ _ _ _ _ _ 3
2 _ _ _ _ _ _ _ _ 2   2 _ _ B _ _ _ _ _ 2   2 _ _ _ _ _ _ B _ 2
1 _ _ _ _ _ _ _ _ 1   1 _ _ _ _ _ _ _ _ 1   1 _ _ _ _ _ _ _ _ 1
  a b c d e f g h       a b c d e f g h       a b c d e f g h
```

In all of these examples, we can see that the queens are not on the same diagonal, row, or column, so they cannot see each other.

~~~~exercism/note
B and W are the queens, standing for Black and White.
This is not relevant info to the puzzle.
~~~~
