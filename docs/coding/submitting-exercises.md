---
title: "Submitting Exercises"
slug: "submitting-exercises"
category: "process"
ordinal: 7
---

After you've [fetched the exercises](/fetching-exercises.html) and written an implementation that gets the tests passing, then you're ready to submit the code to the website so you can discuss its merits and receive feedback.

```bash
exercism submit path/to/your/code.ext
```

For example, if you have been working on the `leap` exercise in Go, you might be in the same directory as the test suite and the code:

```bash
cd ~/exercism/go/leap
ls -1
```

This would output the following:
```
leap.go
leap_test.go
README.md
```

Then you would submit the code with the following command:

```bash
exercism submit leap.go
```

If you get a better idea of how to express your code, perhaps coming from
some "nitpick" feedback, you can submit your code again using the same
command to exercism.  Each version of your submitted code for an exercise
is visible on the web site.

If you get stuck, you can even submit an unfinished solution. In this case
please also remember to comment on your own solution to explain what you were thinking and where you got stuck.
You can then evolve to a complete solution eventually using "nitpicks" from other users.

If you submit wrong file or incomplete file by mistake, you can remove the
most recently submitted solution using the following command:

```bash
exercism unsubmit
```


<a class="secondary-button" href="nitpicking-code.html">Nitpicking Code</a>
