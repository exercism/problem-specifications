# Reverse String

The introductory exercise to arrays and strings. Just reverse input string.

This is a typical first program for beginning programming in a new language
or environment after being able to do simple tasks.

The objectives are simple:

- Write a function that reverses the input string.
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise.

## Tutorial

This exercise has two files:

- reverse-string.js
- reverse-string.spec.js

The first file is where you will write your code.
The second is where the tests are defined.

The tests will check whether your code is doing the right thing.
You don't need to be able to write a test suite from scratch,
but it helps to understand what a test looks like, and what
it is doing.

Open up the test file, reverse-string.spec.js.
There is one test inside:

  xit('detects simple reverse string', function () {
    var subject = new ReverseString('ant');
    var matches = subject.matches(['tna']);

    expect(matches).toEqual(['tna']);
  });

Run the test now, with the following command on the command-line:

    jasmine reverse-string.spec.js

The test fails, which makes sense since you've not written any code yet.

The failure looks like this:

    1) Reverse String says reverse string
       Message:
          Expected undefined to equal 'tna'.

There's more, but this is the most important part.

Take a look at that first line:

    1) Reverse String says reverse string

Now look at the test definition again:

    it('detects simple reverse string', function() {
      // ... more code here ...
    });

Update the code and then run the tests again from the command-line:

    jasmine reverse-string.spec.js

Notice how it changes the failure message.

Then change the implementation in reverse-string.js again, this time to make the test pass.

When you are done, submit your solution to exercism:

    exercism submit reverse-string.js


## Setup

Go through the setup instructions for JavaScript to
install the necessary dependencies:

http://exercism.io/languages/javascript

## Making the Test Suite Pass

Execute the tests with:

    jasmine <exercise-name>.spec.js

Replace `<exercise-name>` with the name of the current exercise. E.g., to
test the Reverse String exercise:

    jasmine reverse-string.spec.js

In many test suites all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by
changing `xit` to `it`.

## Source

This is an exercise to introduce users to using Exercism and arrays and strings [https://medium.freecodecamp.org/how-to-reverse-a-string-in-javascript-in-3-different-ways-75e4763c68cb](https://medium.freecodecamp.org/how-to-reverse-a-string-in-javascript-in-3-different-ways-75e4763c68cb)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
