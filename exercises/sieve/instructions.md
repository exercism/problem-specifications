# Instructions

Your task is to create a program that implements the Sieve of Eratosthenes algorithm to find prime numbers.

A prime number is a number that is only divisible by 1 and itself.
For example, 2, 3, 5, 7, 11, and 13 are prime numbers.

To use the Sieve of Eratosthenes, you first create a list of all the numbers between 2 and your given number.
Then you repeat the following steps:

1. Find the next unmarked number in your list. This is a prime number.
2. Mark all the multiples of that prime number as **not** prime.

You keep repeating these steps until you've gone through every number in your list.
At the end, all the unmarked numbers are prime.

~~~~exercism/note
For example, if you're finding the primes between 2 and 10:
1. Mark 2 as prime.
   Mark 4, 6, 8 and 10 as not prime.
2. Mark 3 as prime.
   Mark 6 and 9 as not prime.
3. Skip 4 as it's marked as not-prime.
4. Mark 5 as prime.
   Mark 10 as not prime _(optional - as it's already been marked)_.
5. Skip 6 as it's marked as not-prime.
6. Mark 7 as prime.
7. Skip 8 as it's marked as not-prime.
8. Skip 9 as it's marked as not-prime.
9. Skip 10 as it's marked as not-prime.

You've examined all numbers and found 2, 3, 5, and 7 as the primes below 10.
~~~~

**Note:** The tests don't check that you've implemented the algorithm, only that you've come up with the correct list of primes.
To check you are implementing the Sieve correctly, a good first test is to check that you do not use division or remainder operations.
