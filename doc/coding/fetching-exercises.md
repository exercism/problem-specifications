---
title: "Fetching Exercises"
slug: "fetching-exercises"
category: "process"
ordinal: 6
---

First make sure you have [configured the CLI](/configuring-the-cli.html).
Adding your API key is required for later steps to work.

To fetch the first problem in each track, issue the command:

```bash
exercism fetch
```

Or you can fetch your current problems in a single track, for example Haskell:

```bash
exercism fetch haskell
```

To check which languages are available, and what to call them on the command line,
use the command:

```bash
exercism tracks
```

The program will download the exercises to the configured project directory.

Note that the code will be put in that directory even if you are somewhere else on the filesystem when calling `exercism fetch`.

To start working on an exercise, go find the downloaded files.

```bash
cd path/to/exercism/project # or whatever
```

You can work on them using your usual editor, tools, and environment. Read the <a class="link-side-menu" href="#sidr">getting started guide</a> of your language to find out how to run the tests.

As soon as you have submitted code to an exercise, `exercism fetch` will provide you with access to the next exercise.

If you need to update your downloaded files for an exercise, delete the files and fetch the exercises for that language again. The newer versions of the files will be downloaded.

If you're no longer working on the exercise, you may need to run `exercism restore` in order to re-download your solutions as well as the exercise files.

<a class="secondary-button" href="submitting-exercises.html">Submitting Exercises</a>
