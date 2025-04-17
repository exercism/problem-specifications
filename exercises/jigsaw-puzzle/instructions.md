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

For this exercise, you may assume square pieces, so that the format can be derived from the aspect ratio:

- If the aspect ratio is less than 1, it's `portrait`
- If it is equal to 1, it's `square`
- If it is greater than 1, it's `landscape`
