# Contributing

It's pretty tricky to keep all the language tracks in good working order,
and it's not uncommon that people discover typos in the README or the test
suites, inconsistencies between the README and the tests, missing edge cases,
factual errors, logical errors, and confusing ambiguities.

We welcome contributions of all sorts and sizes, from reporting issues to
submitting patches, to hanging out in the support chat to help people get
unstuck.

We are grateful for any help in making Exercism better!

-----

This guide covers several common scenarios pertaining to **improving the language tracks**
themselves. There are other guides about contributing to other parts of the Exercism ecosystem.

* [The Command-Line Client](https://github.com/exercism/cli/blob/master/README.md)
* [The Website](https://github.com/exercism/website/blob/master/CONTRIBUTING.md)
* [The Exercises API](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md) (used by both the command-line client and the website)

## Table of Contents

* [We Will Gladly Help You Help Us](#we-will-gladly-help-you-help-us)
* [Code of Conduct](#code-of-conduct)
* [Overview](#overview)
* [Updating an Exercise Test Suite](#updating-an-exercise-test-suite)
    * [Updating a Generated Test Suite](#updating-a-generated-test-suite)
* [Implementing a Completely New Exercise](#implementing-a-completely-new-exercise)
* [Track Anatomy](#track-anatomy)
* [Starting a New Track](#starting-a-new-track)
    * [Beta-Testing a Language Track](#beta-testing-a-language-track)
* [Useful Tidbits](#useful-tidbits)
    * [Pull Request Guidelines](#pull-request-guidelines)
    * [Exercise Versioning](#exercise-versioning)
    * [Anatomy of an Exercise](#anatomy-of-an-exercise)
    * [Track configuration file (config.json)](#track-configuration-file)
    * [Track-Level Linting With Configlet](#track-level-linting-with-configlet)
    * [Git Basics](#git-basics)
    * [Improving Consistency By Extracting Shared Test Data](#improving-consistency-by-extracting-shared-test-data)

## We Will Gladly Help You Help Us

It can be confusing and intimidating to figure out how to fix even a tiny
thing in a small project, much less a sprawling 50 repository beast like
Exercism.

We'll do everything we can to help you get started.

The two best ways to get help are to

* jump into the [support chat](https://gitter.im/exercism/support).
* open a [GitHub issue](https://github.com/exercism/exercism.io/issues).

We are happy to help out with all sorts of things, including figuring
out the whole git and pull request thing.

Don't be shy, we're a friendly bunch!

If you have questions that you're not comfortable asking out in the open,
email Katrina at kytrinyx@exercism.io.

## Code of Conduct

Help us keep Exercism welcoming. Please read and abide by the
[Code of Conduct](https://exercism.io/code-of-conduct).

## Overview

Each language track is implemented in its own repository. This has several
benefits:

* It's easier to get started contributing, since you don't need to wade through
  setup instructions for 20 different languages.
* There's less noise for people who are maintaining a language track, since they
  won't be seeing pull requests and issues about languages they're not maintaining.
* Build tools can be tailored to each language.
* Continuous integration runs more quickly, since it only needs to install a single
  language environment, and run the tests for one single track.

We use the following terminology:

* **Language** - A programming language.
* **Track** - A collection of exercises in a programming language.
* **Problem** - A generic problem description.
* **Exercise** - A language-specific implementation of a problem description.

### Language Track Repositories

We've given each language track an ID, which is a url-friendly version of the
language name. For example, _C++_ has the ID `cpp`. This ID is used throughout
the Exercism ecosystem.

Each language-specific repository can be found under the Exercism GitHub
organization named with the track ID.

```text
https://github.com/exercism/{TRACK_ID}
```

For example, the C++ repository is [exercism/cpp](https://github.com/exercism/cpp).

### Problem Metadata

Many languages implement an exercise based on the same generic problem
description. So you might have a "leap year" exercise in Haskell,
JavaScript, Go, Ruby, and Python. The basic premise will be the same,
but each language will tailor the exercise to fit the idioms and
idiosyncrasies of that language.

We try to keep the generic descriptions generic--we avoid implementation-specific
examples, and try not to be too prescriptive about suggesting how a problem
might be solved.

The README of each exercise is pieced together from various bits and pieces of this
shared metadata, along with some information that is custom to the language track
in question.

Some of the problems also have a JSON file containing canonical test cases. These
are used to hand-craft a test suite generator, allowing us to quickly regenerate
test suites when edge cases or errors are discovered.

The generic problem descriptions live in the `exercises` folder in this repository
([exercism/problem-specifications](https://github.com/exercism/problem-specifications)).

## Updating an Exercise Test Suite

Once you [find the correct repository](#language-track-repositories),
you can [fork it](https://help.github.com/articles/fork-a-repo/) and then [clone it](https://help.github.com/articles/cloning-a-repository/).

The README in each individual language track repository covers how to set
up the development environment for that language.

Often all you need is a running language environment along with the relevant
testing library.

If the test suite was generated, then editing the solution will require a
couple of extra steps. This is covered in detail in a [separate section of
this guide](#updating-a-generated-test-suite).

The test suite is usually named with _test_ or _Test_ in the filename, though
some language tracks have other conventions (e.g. _spec_ is fairly common, and
sometimes it's just a matter of a different file extension).

If you're unsure where to make the change, ask us, and we'll help you figure it out.

Once you've updated the test suite, there are a few things you'll want to check.

- Make sure the [reference solution](#reference-solution) is still passing.
- If the exercise is [versioned](#exercise-versioning), and the change will
  mean that existing solutions on the site will not pass the new tests, then
  increment the version number, both in the test and in the reference solution.
- Run the full, track-level test suite, if available.
  If the track has a way to automatically run all the tests against their
  reference solutions, it will be documented in the README.
- Run [configlet](#track-level-linting-with-configlet), the track-level linter.

You can also take a look at the `.travis.yml` file to see what the continuous
integration system will do to verify the track.

Take a look at our [pull request guidelines](#pull-request-guidelines).
You don't need to get it perfect the first time around; we'll work with you to
get the patch merged.

### Updating a Generated Test Suite

Some language tracks are experimenting with generating test suites from shared
test data. This is because various interesting edge cases are discovered as
people discuss solutions, but these edge cases are usually then only added
to a single language track. By standardising the inputs and outputs, it becomes
easier to improve the exercises across all the languages.

There are two possible scenarios, described below.

1. You want to change or add inputs or outputs.
1. You want to change something about the test suite itself.

Once you've made the change, then follow the instructions about verifying your change
and submitting a patch as described above, in the section about [updating an exercise
test suite](#updating-an-exercise-test-suite).

#### Changing Inputs and Outputs

If you want to add a new test or change some inputs or outputs, then the change
needs to be made in the [exercism/problem-specifications repository](https://github.com/exercism/problem-specifications),
not directly to the test suite itself.

Find the JSON file for the problem in question. For example, if you want to change
the Clock problem, then look for `exercises/clock/canonical-data.json`. Each
change should also bump the version of the test data. For more information,
see the [test data versioning](README.md#test-data-versioning) section of the
README.

Submit a pull request with the change.

When that pull request has been merged, then the various languages that implement that
problem will need to have their test suites regenerated. Track maintainers can do this,
though we're always happy if you want to submit a patch with the regenerated test suite.

The instructions for regenerating a test suite should be described in the README
of the language-specific repository.

Follow the guidelines for setting up a development environment, verifying the change,
and submitting a pull request, as described in the [main section about updating an
exercise test suite](#updating-an-exercise-test-suite).

#### Changing the Structure

If you are not changing inputs/outputs, but rather the structure of the test suite,
then that change will need to be made within the generator itself. It lives in
the language-specific repository along with the exercises, and the process for
regenerating the exercise should be described in the README of the repository.

Follow the guidelines for setting up a development environment, verifying the change,
and submitting a pull request, as described in the [main section about updating an
exercise test suite](#updating-an-exercise-test-suite).

## Implementing a Completely New Exercise

A problem must have a unique slug. This slug is used as

* the directory name within each language-specific repository
* the directory name for the folder that contains the metadata files (in this repository)
* to identify the exercise in `config.json`

### In exercism/problem-specifications

* Create `exercises/<slug>/description.md` and `exercises/<slug>/metadata.yml`.
* Bonus: `exercises/<slug>/canonical-data.json` with inputs/outputs for the test suite.
* Submit a pull request.

### In exercism/<TRACK_ID>

* Do the same as when [porting an
  exercise](#porting-an-exercise-to-another-language-track).
  Reference the PR in problem-specifications.
  It's suggested, but not required, to wait until the problem-specifications PR is merged before merging the track-specific PR, for the following reasons:
    * If changes are suggested to the problem-specifications PR, it is likely that they will be applicable to the track-specific PR as well.
    * Only applicable if the exercise needs a custom `title` in metadata.yml (as described in https://github.com/exercism/docs/blob/master/you-can-help/make-up-new-exercises.md#problem-specification): The title of the exercise as displayed on the website will use the default algorithm instead of the correct title until the problem-specifications PR is merged.
    * Only applicable to tracks that have specific tools that depend on exercises being present in problem-specifications (see the track-specific documentation for whether any such tools exist): Such tools may operate unexpectedly if the exercise does not yet exist in problem-specifications. Try checking out the branch on a local copy of problem-specifications or rerunning the tool after the problem-specifications PR is merged if applicable.

## Track Anatomy

Each track should have the following structure:

```text
├── .gitignore
├── .travis.yml
├── LICENSE
├── README.md
├── SETUP.md
├── bin
│   └── fetch-configlet
├── config.json
├── docs
│   ├── ABOUT.md
│   ├── INSTALLATION.md
│   ├── LEARNING.md
│   ├── RESOURCES.md
│   └── TESTS.md
└── exercises
    └── hello-world
        ├── hello-world_example.file
        ├── hello-world.file
        └── hello-world_test.file
```

The example template for a track can be found in the [request-new-language-track repository](https://github.com/exercism/request-new-language-track).

* `LICENSE` - The MIT License (MIT)
* `README.md` - a thorough explanation of how to contribute to the track.
* `SETUP.md` - this should contain any track specific, problem agnostic information that will be included in the README.md of every exercise when fetched. Include information on how to run tests, how to get help, etc.
* `bin` - scripts and other files related to running the track's tests, etc.
* `config.json` - the track-level configuration. It contains configuration for which exercises (and in which order) are a part of the track, which exercises are deprecated, the track id, name of the language, and the location of the repository. Optionally, it may include a regex to recognize what files are part of the test suite (usually `/test/i`, but sometimes `/spec/i` or other things). If the test pattern is not included, then `/test/i` is assumed.
* `docs` - the documentation for the track.These files are served to the exercism.io help site via the x-api. It should contain at minimum:

    - `INSTALLATION.md` - about how to get the track's language set up locally.
    - `TESTS.md` - how to run the tests for the track's individual exercises.

    Some nice to haves:

    - `ABOUT.md` - a short, friendly blurb about the track's language. What types of problems does it solve really well? What is it typically used for?
    - `LEARNING.md` - a few notes about where people might want to go to learn the track's language from scratch. These are the the resources you need only when first getting up to speed with a language (tutorials, blog posts, etc.).
    - `RESOURCES.md` - references and other useful resources. These resources are those that would commonly be used by a developer on an ongoing basis (core language docs, api docs, etc.).

* `exercises` - all exercises for the track should live in subdirectories of this directory. Each exercise should have a test file, an example file that should pass all tests, and a template file that is a stub to help the user get started with the exercise. The example file should be used for the CI build.

## Starting a New Track

If you're interested in adding problems for a language that we don't yet have,
open an issue in the https://github.com/exercism/request-new-language-track repository.

### Beta-Testing a Language Track
---

For a track that is set as `"active": false` in the `config.json`, `exercism fetch`
will not automatically pull down problems. You can still test the language by
fetching problems directly, e.g.:

```shell
exercism fetch cpp bob
```

This will allow you to do some dry-run tests of fetching exercises,
double checking the instructions for each problem and submitting the
problem solution for peer review.

It is recommended that you configure a [Travis continuous integration build](http://travis-ci.org)
with your language track to verify that your example problem solutions
satisfy the tests provided for each problem.

You can include advice and helpful links for your language track in the
`SETUP.md` file.

## Useful Tidbits

Here are a few bits and pieces that are referenced from some of the
scenarios in this guide.

### Pull Request Guidelines

See the [pull request guidelines](https://github.com/exercism/docs/blob/master/contributing/pull-request-guidelines.md) in the docs repository.

### Exercise Versioning

It's only when we get a bunch of people having conversations about the
solutions that we really discover what makes a problem interesting, and
in what way it can be improved.

Some changes to the test suites will invalidate existing solutions that people
have submitted.

We think this is totally fine, however sometimes people start leaving feedback
saying _this doesn't pass the tests_. This is technically true, but since the
solution passed the tests at the time it was written, it's generally more
useful to just discuss the code as it is, rather than enforce strict
adherence to the most recent version of the tests.

Some language tracks have implemented a simple, manual versioning system to
help avoid unnecessary discussions about failing the current test suites.

If the exercise is versioned, then the test suite will probably have a
_book-keeping_ type test at the very bottom that asserts against a value in
the reference solution. If the change you're making is backwards-incompatible,
then please increment the version in both the test suite and the reference
solution.

Please review the details in [README.md](https://github.com/exercism/problem-specifications#test-data-versioning) and bump the version number accordingly.

### Anatomy of an Exercise

See the [anatomy of an exercise](https://github.com/exercism/docs/tree/master/language-tracks/exercises/anatomy) in the docs repository.

### Track configuration file

Each language track has a configuration file called `config.json`.

Important keys are:
* `problems` - actively served via `exercism fetch`
* `deprecated` - implemented, but aren't served anymore
* `foregone` - will not be implemented in the track

The `configlet` tool uses those categories to ensure that

1. all the `problems` are implemented,
2. `deprecated` problems are not actively served as problems, and
3. `foregone` problems are not implemented.

In addition, it will complain about problems that are implemented but are not
listed in the config under the `problems` key.

A problem might be foregone for a number of reasons, typically because it's a
bad exercise for the language.

Optional keys:
* `test_pattern` - A (case sensitive) regex pattern that test filenames will match. It is used to determine which files will be visible on a problem's test-suite page on the exercism.io site. The default value used if this key is not present is `test` (note: this is case _insensitive_)
* `ignore_pattern` - A (case insensitive) regex pattern that will cause files matching it to not be served to the student by `exercism fetch`. The default value used if this key is not present is `example`
* `solution_pattern` - A (case sensitive) regex pattern that matches solution files in the track repository. Used by [configlet](https://github.com/exercism/configlet) to check for the presence of an example solution for each problem implemented by the track.  The default value used if this key is not present is `[Ee]xample`.

### Git Basics
See [Git Basics](https://github.com/exercism/docs/blob/master/contributing/git-basics.md) in [docs](https://github.com/exercism/docs) repository.

### et cetera

TODO: add more sections:

- how to merge something locally (for example when there are conflicts, or
  if you want to fix a small thing without nagging the contributor about it)


## Improving Consistency By Extracting Shared Test Data

This documentation has moved [to the docs repository](https://github.com/exercism/docs/blob/master/you-can-help/improve-exercise-metadata.md).

We are maintaining this section, since many open issues link to it.
