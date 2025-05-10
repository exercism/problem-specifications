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

![A 2 by 3 jigsaw puzzle](https://camo.githubusercontent.com/bb806ba85321c2b739e882d6f872897150a87134765383e26a47d88bfe0aa7f8/68747470733a2f2f6173736574732e657865726369736d2e6f72672f696d616765732f6578657263697365732f70696563696e672d69742d746f6765746865722f6a69677361772d70757a7a6c652d3278332e737667)

### Square

A square jigsaw puzzle with 9 pieces of which all except the centre piece are border pieces. It has 3 rows and 3 columns. The aspect ratio is 1 (3/3).

![A 3 by 3 jigsaw puzzle](https://camo.githubusercontent.com/499ca9b4913aac4f3ae18eeec392209ac8b360d892b7cb3be5d28cba4075602c/68747470733a2f2f6173736574732e657865726369736d2e6f72672f696d616765732f6578657263697365732f70696563696e672d69742d746f6765746865722f6a69677361772d70757a7a6c652d3378332e737667)

### Landscape

A landscape jigsaw puzzle with 12 pieces of which 10 are border pieces and 2 are inside pieces. It has 3 rows and 4 columns. The aspect ratio is 1.333333... (4/3).

![A 4 by 3 jigsaw puzzle](https://camo.githubusercontent.com/45b18efc8524284928bd8cae6bd72b661e1b9a1ca8959fe5131c7985671030a0/68747470733a2f2f6173736574732e657865726369736d2e6f72672f696d616765732f6578657263697365732f70696563696e672d69742d746f6765746865722f6a69677361772d70757a7a6c652d3478332e737667)

