# Description

A friend of yours is learning how to solve Killer Sudokus (rules below) but struggling to figure out which digits can go in a cage.
They ask you to help them out by writing a small program that lists all valid combinations for a given cage, and any constraints that affect the cage.

To make the output of your program easy to read, the combinations it returns must be sorted.

## Killer Sudoku Rules

- [Standard Sudoku rules](https://masteringsudoku.com/sudoku-rules-beginners/) apply.
- The digits in a cage, usually marked by a dotted line, add up to the small number given in the corner of the cage.
- A digit may only occur once in a cage.

For a more detailed explanation, check out [this guide](https://masteringsudoku.com/killer-sudoku/).

## Example 1: Cage with only 1 possible combination

In a 3-digit cage with a sum of 7, there is only one valid combination: 124.

- 1 + 2 + 4 = 7
- Any other combination that adds up to 7, e.g. 232, would violate the rule of not repeating digits within a cage.

![https://media.githubusercontent.com/media/exercism/v3-files/main/julia/killer-sudoku-helper/example1.png](https://media.githubusercontent.com/media/exercism/v3-files/main/julia/killer-sudoku-helper/example1.png)

## Example 2: Cage with several combinations

In a 2-digit cage with a sum 10, there are 4 possible combinations:

- 19
- 28
- 37
- 46

![https://media.githubusercontent.com/media/exercism/v3-files/main/julia/killer-sudoku-helper/example2.png](https://media.githubusercontent.com/media/exercism/v3-files/main/julia/killer-sudoku-helper/example2.png)

## Example 3: Cage with several combinations that is restricted

In a 2-digit cage with a sum 10, where the column already contains a 1 and a 4, there are 2 possible combinations:

- 28
- 37

19 and 46 are not possible due to the 1 and 4 in the column according to standard Sudoku rules.

![https://media.githubusercontent.com/media/exercism/v3-files/main/julia/killer-sudoku-helper/example3.png](https://media.githubusercontent.com/media/exercism/v3-files/main/julia/killer-sudoku-helper/example3.png)

## Trying it yourself

If you want to give an approachable Killer Sudoku a go, you can try out [this puzzle](https://app.crackingthecryptic.com/sudoku/HqTBn3Pr6R) by Clover, featured by [Mark Goodliffe on Cracking The Cryptic on the 21st of June 2021](https://youtu.be/c_NjEbFEeW0?t=1180).

You can also find Killer Sudokus in varying difficulty in numerous newspapers, as well as Sudoku apps, books and websites.

## Credit

The screenshots above have been generated using [F-Puzzles.com](https://www.f-puzzles.com/), a Puzzle Setting Tool by Eric Fox.
