# Instructions

Given partial information about a jigsaw puzzle, complete the remaining details.

If the information is insufficient to complete the details, or if it contains contradictions, the user should be notified.

The full information about the jigsaw puzzle contains the following parts:

- `pieces`: Total number of pieces
- `border`: Number of border pieces
- `inside`: Number of inside (non-border) pieces
- `rows`: Number of rows
- `columns`: Number of columns
- `aspectRatio`: Aspect ratio of columns to rows
- `format`: Puzzle format, which can be `portrait`, `square`, or `landscape`

For this exercise, you may assume square pieces, so that the format can be derived from the aspect ratio:

- If the aspect ratio is less than 1, it's `portrait`
- If it is equal to 1, it's `square`
- If it is greater than 1, it's `landscape`

## Three examples

### Portrait

A portrait jigsaw puzzle comprising 6 pieces of which all are border pieces and none are inside pieces. It has 3 rows and 2 columns. The aspect ratio is 1.5 (3/2).

![A 2 by 3 jigsaw puzzle](https://assets.exercism.org/images/exercises/piecing-it-together/jigsaw-puzzle-2x3.svg)

### Square

A square jigsaw puzzle with 9 pieces of which all except the centre piece are border pieces. It has 3 rows and 3 columns. The aspect ratio is 1 (3/3).

![A 3 by 3 jigsaw puzzle](https://assets.exercism.org/images/exercises/piecing-it-together/jigsaw-puzzle-3x3.svg)

### Landscape

A landscape jigsaw puzzle with 12 pieces of which 10 are border pieces and 2 are inside pieces. It has 3 rows and 4 columns. The aspect ratio is 1.333333... (4/3).

![A 4 by 3 jigsaw puzzle](https://assets.exercism.org/images/exercises/piecing-it-together/jigsaw-puzzle-4x3.svg)
