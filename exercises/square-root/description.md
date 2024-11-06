# Description

We are launching a deep space exploration rocket and we need a way to make sure the navigation system stays on target.

The first step in our coordinate calculation involves taking a number as input and finding another number which multiplied by itself will equal our input number, or in other words, finding the square root of our input number.

Because the journey will be very long, we had to make our rocket’s onboard computer very power efficient so it wouldn’t drain the batteries. Unfortunately that means that we can’t rely on fancy math libraries and functions, as they would take more power. Instead we want to calculate or approximate the square root directly.

Your task is to implement a function that calculates or approximates the square root of a given number.

- Try to avoid using the pre-existing math libraries of your language.
- As input you’ll be given a positive whole number, i.e. 1, 2, 3, 4…
- The function also only needs to output positive whole numbers.

Examples of some approaches you could consider are:

- Linear or binary search for a number that gives the input number when squared
- Successive approximation using Newton's or Heron's method
- Calculating one digit at a time or one bit at a time

You can check out the Wikipedia pages on [integer square root][integer-square-root] and [methods of computing square roots][computing-square-roots] to help with choosing a method of calculation.

[integer-square-root]: https://en.wikipedia.org/wiki/Integer_square_root
[computing-square-roots]: https://en.wikipedia.org/wiki/Methods_of_computing_square_roots
