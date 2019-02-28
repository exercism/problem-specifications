If you would build anything with a Raspberry Pi or an Arduino, one of the components you will likely use are resistors. In this exercise, it doesn't matter what a resistor is or how it works, the only thing that matters is that a resistor has a 'value'. And that they are small. So small, that it's hard to read such a value if it were to be actually printed on it. To solve that, fabricators use color codes that denotes the resistor's value. Which is great, but it makes it hard to see the actual value.

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
