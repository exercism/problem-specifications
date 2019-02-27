If you would build anything with a Raspberry Pi or an Arduino, one of the first components you need are resistors. In this exercise, it doesn't matter what a resistor is or does, the only thing that matters is that they come with different values. And that they are tiny. So tiny, that it's hard to read such a value if it were printed on the thing. To solve that, fabricators use color codes that reveal their value. Which is great, but it makes it hard to see the actual value.

You are going to solve this with a program that you can feed two colors, and it will translate the color to a number. For instance "brown" and "black" are code for `1` and `0`, and together they represent the value `10`.

The band colors are encoded as follows:

- Black: 0
- Brown: 1
- Red: 2
- Orange: 3
- Yellow: 4
- Green: 5
- Blue: 6
- Violet: 7
- Grey: 8
- White: 9