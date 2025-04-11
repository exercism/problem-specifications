# Instructions

You get part of the information and need to fills in the blanks.
In case the data is insufficient or contradictory the user needs to be notified of the issue.
The full information about the jigsaw puzzle contains the following parts:

- `pieces`: Number of pieces
- `border`: Number of border pieces
- `inside`: Number of inside pieces
- `rows`: Number of rows of pieces
- `columns`: Number of columns of pieces
- `aspectRatio`: Aspect ratio of columns / rows
- `format`: Puzzle format, which can be `portrait`, `square`, or `landscape`

For the sake of the exercise, you may assume square pieces, so that the format can be derived from the aspect ratio.
If it is lower than one, it is portrait, if exactly one, it is square and larger than one is landscape.
