You get part of the information and need to fills in the blanks. If the provided information is insufficient to calculate the rest, there should be an error "Insufficient information". If the data given is contradictory, there should be an error "Contradictory information" The full information about the jigsaw puzzle contains the following parts:

- `pieces`: Number of pieces
- `border`: Number of border pieces
- `inside`: Number of inside pieces
- `rows`: Number of rows of pieces
- `columns`: Number of columns of pieces
- `aspectRatio`: Aspect ratio of columns / rows
- `format`: Format of the puzzle: `"portrait" / "square" / "landscape" / "globe"`

For the rows and columns of a puzzle globe, assume an aspect ratio of 1.0, so rows and columns are identical.

Spoilt by the comfort of your helper, your friend now no longer wants to count border pieces. To help with estimating, you take the number of pieces and return an array of the possible numbers of rows and columns.

Start with the lowest number of rows and work your way up from there. While a single-row jigsaw puzzle might be a strange novelty, it is theoretically possible, so you should include this case.
