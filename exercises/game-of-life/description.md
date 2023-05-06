# Description

[Conway's Game of Life][game-of-life] is a fascinating cellular automaton created by the British mathematician John Horton Conway in 1970. The game consists of a two-dimensional grid of cells that can either be "alive" or "dead." Each generation, the cells interact with their eight neighbors, which are cells adjacent horizontally, vertically, or diagonally.

On each new generation, the following rules are applied:

- Any live cell with two or three live neighbours lives on.
- Any dead cell with three live neighbours becomes a live cell.
- All other cells die or stay dead.

Given a matrix of 1s and 0s (corresponding to live and dead cells), apply the rules to each cell, output the next generation.

[game-of-life]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
