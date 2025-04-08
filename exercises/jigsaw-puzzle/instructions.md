You get part of the information and need to fills in the blanks.
In case the data is insufficient or contradictory the user needs to be notified of the issue.
The full information about the jigsaw puzzle contains the following parts:

- `pieces`: Number of pieces
- `border`: Number of border pieces
- `inside`: Number of inside pieces
- `rows`: Number of rows of pieces
- `columns`: Number of columns of pieces
- `aspectRatio`: Aspect ratio of columns / rows
- `format`: Puzzle format, which can be `portrait`, `square`, `landscape`, or `globe`

For a puzzle in `globe` format, assume an aspect ratio of 1.0.

Spoilt by the comfort of your helper, your friend now no longer wants to count border pieces.
To help with estimating, you take the number of pieces and return a list of the possible numbers of rows and columns.

Start with the lowest number of rows and work your way up from there.
While a single-row jigsaw puzzle might be a strange novelty, it is theoretically possible, so you should include this case.

