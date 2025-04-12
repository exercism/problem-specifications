# Instructions

Given partial information about a jigsaw puzzle, complete the remaining details.

If the information is insufficient to complete the details, or if it contains contradictions, the user should be notified.

The full information about the jigsaw puzzle contains the following parts:

- `pieces`: Total number of pieces
- `border`: Number of border pieces
- `inside`: Number of inside pieces
- `rows`: Number of rows
- `columns`: Number of columns
- `aspectRatio`: Aspect ratio of columns to rows
- `format`: Puzzle format, which can be `portrait`, `square`, or `landscape`

For the sake of the exercise, you may assume square pieces, so that the format can be derived from the aspect ratio.

If it is lower than one, it is portrait, if exactly one, it is square and larger than one is landscape.
