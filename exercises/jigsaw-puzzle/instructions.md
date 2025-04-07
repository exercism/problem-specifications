### Task 1

Provide a function `jigsawData` that receives a part of the information and fills in the blanks. If the provided information is insufficient to calculate the rest, there should be an error "Insufficient information". The full information about the jigsaw puzzle contains

- `pieces`: Number of pieces
- `border`: Number of border pieces
- `inside`: Number of inside pieces
- `rows`: Number of rows of pieces
- `columns`: Number of columns of pieces
- `aspecRatio`: Aspect ratio of columns / rows
- `format`: Format of the puzzle: `"portrait" / "square" / "landscape" / "3d ball"`

For the rows and columns of a 3d ball puzzle, assume a square distribution.

### Task 2

Spoilt by the comfort of your helper, your friend now no longer wants to count border pieces, so they want another function that gives them a list of the possible even rows/columns configuration for a number of pieces, so they can estimate from the picture in the future.

Write a `jigsawConfigurations` function that takes the number of pieces and returns an array of the possible numbers of rows and columns.

Start with the lowest number of rows and work your way up from there. While a single-row jigsaw puzzle might be a strange novelty, it is theoretically possible, so you should include this case.
