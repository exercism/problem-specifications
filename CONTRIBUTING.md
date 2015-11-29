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

* [The Command-Line Client](https://github.com/exercism/cli/blob/master/CONTRIBUTING.md)
* [The Website](https://github.com/exercism/exercism.io/blob/master/CONTRIBUTING.md)
* [The Exercises API](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md) (used by both the command-line client and the website)

## Table of Contents

* [We Will Gladly Help You Help Us](#we-will-gladly-help-you-help-us)
* [Code of Conduct](#code-of-conduct)
* [Overview](#overview)
* [Updating an Exercise Test Suite](#updating-an-exercise-test-suite)
    * [Updating a Generated Test Suite](#updating-a-generated-test-suite)
* [Tweaking a README](#tweaking-a-readme)
* [Porting an Exercise to a Another Language Track](#porting-an-exercise-to-another-language-track)
* [Implementing a Completely New Exercise](#implementing-a-completely-new-exercise)
* [Improving Consistency By Extracting Shared Test Data](#improving-consistency-by-extracting-shared-test-data)
* [Writing a New Test Suite Generator](#writing-a-new-test-suite-generator)
* [Maintaining a Track](#maintaining-a-track)
* [Useful Tidbits](#useful-tidbits)
    * [Exercise Versioning](#exercise-versioning)
    * [Anatomy of an Exercise](#anatomy-of-an-exercise)
    * [Track-Level Linting With Configlet](#track-level-linting-with-configlet)

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
[Code of Conduct](https://github.com/exercism/exercism.io/blob/master/CODE_OF_CONDUCT.md).

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
organization, named with the track ID, prefixed with `x`.

```
https://github.com/exercism/x{TRACK_ID}
```

For example, the C++ repository is [exercism/xcpp](https://github.com/exercism/xcpp).

### Problem Metadata

Many languages implement an exercise based on the same generic problem
description. So you might have a "leap year" exercise in Haskell,
JavaScript, Go, Ruby, and Python. The basic premise will be the same,
but each language will tailor the exercise to fit the idioms and
idiosyncracities of that language.

We try to keep the generic descriptions generic--we avoid implementation-specific
examples, and try not to be too prescriptive about suggesting how a problem
might be solved.

The README of each exercise is pieced together from various bits and pieces of this
shared metadata, along with some information that is custom to the language track
in question.

Some of the problems also have a JSON file containing shared test cases. These
are used to hand-craft a test suite generator, allowing us to quickly regenerate
test suites when edge cases or errors are discovered.

The generic problem descriptions live in this repository
([exercism/x-common](https://github.com/exercism/x-common)).

## Updating an Exercise Test Suite

Once you [find the correct repository](#language-track-repositories),
you can [fork it](https://help.github.com/articles/fork-a-repo/) and then clone it.

The README in each individual language track repository covers how to set
up the development environment for that language.

Often all you need is a running language environment along with the relevant
testing library.

If the test suite was generated, then editing the solution will require a
couple of extra steps. This is covered in detail in a [separate section of
this guide](#updating-a-generated-test-suite).

The test suite is usually named with _test_ or _Test_ in the filename, though
some language tracks have other conventions (e.g. _spec_ is fairly common, and
sometimes it's just a matter of a different file extention).

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
easier to and improve the exercises across all the languages.

There are two possible scenarios, described below.

1. You want to change or add inputs or outputs.
1. You want to change something about the test suite itself.

Once you've made the change, then follow the instructions about verifying your change
and submitting a patch as described above, in the section about [updating an exercise
test suite](#updating-an-exercise-test-suite).

#### Changing Inputs and Outputs

If you want to add a new test or change some inputs or outputs, then the change
needs to be made in the [exercism/x-common repository](https://github.com/exercism/x-common),
not directly to the test suite itself.

Find the JSON file for the problem in question. For example, if you want to change
the Clock problem, then look for `clock.json`.

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

## Tweaking a README

The Exercism exercise README treads a very fine line between useful ambiguity and confusing
vagueness. Because the README is the same whether you're solving the problem in C++ or in Lua,
the problem description needs to be high-level enough to allow for the syntactic, semantic, and
philosophical differences in the various languages.

In other words: no specific references to syntax or data structures of a specific language
can be used to further clarify a problem.

However, within this purposeful ambiguity might lie some opportunities for making an exercise
description more clear. Typical issues to be attentive to:

- poorly worded sentences
- outdated information
- incorrect directives
- typos

Each language's test suite provides the precise specification for the
exercise, which allows the user to view the problem from a perspective that is
interesting and idiomatic for that specific language.

In addition, there's some language-specific content that gets woven into
the README, usually a quick reminder about how to run the tests, and
where to find more documentation.

### Updating a Generic Problem Description

[Fork this repository](https://github.com/exercism/x-common/fork).

Each generic problem is identified by a slug. For example, the problem _Crypto
Square_ is `crypto-square`. There are two metadata files for each problem:

* `<slug>.md` which contains the generic problem description which makes up
  the bulk of the README, and
* `<slug>.yml` which contains a short one-line description of the problem as
  well as other metadata, such as the source that inspired the problem in the
  first place.

There aren't any rules about what a good exercism problem README looks like.
If in doubt, [open up a GitHub issue](https://github.com/exercism/x-common/issues/new)
describing your suggestion.

Once you've made your change [submit a pull
request](#pull-request-guidelines).

### Updating Language-Specific Additions

TODO: write about `SETUP.md`

## Porting an Exercise to a Another Language Track

TODO: elaborate.

* http://x.exercism.io/problems/:slug has list of tracks that
  implement the problem. Better would be
  `http://x.exercism.io/v3/problems/:slug`. See
  [exercism/x-api#75](https://github.com/exercism/x-api/issues/75).
* There might be shared metadata that gives ideas about inputs/outputs
  (in this repository, as `<slug>.json`.
* Write the test suite, implement a reference file, add the exercise
  to config.json, submit a PR.

## Implementing a Completely New Exercise

TODO: elaborate.

* Make the `<slug>.md` and `<slug>.yml` (in x-common).
* Submit PR.
* Do same as when [porting an
  exercise](#porting-an-exercise-to-another-language-track).
  Reference the PR in x-common if it hasn't been merged yet,
  this should not be merged until the x-common one is merged.
* Bonus: `<slug>.json`.

## Improving Consistency By Extracting Shared Test Data

TODO: elaborate.

## Writing a New Test Suite Generator

TODO: elaborate.

## Maintaining a Track

Maintaining a language track generally consists of:

- Reviewing/merging pull requests.
- Discussing improvements in the exercises.
- Implementing or porting new exercises.
- Improving the development tooling (e.g. implementing continuous
  integration).
- Language-Specific support.
- Adding/improving language-specific documentation.

Ideally a track will have several maintainers, for two reasons:

- more lively
- spread the workload

** More Lively**

We've noticed that as soon as there are at least two people maintaining
the same track we get rich discussions about quality and idioms. There's a lot
more activity, and it's a lot more fun.

** Spread the Workload **

We don't want to burn people out, and it's really nice to be able to
go on vacation or get busy at work without worrying too much about a growing
backlog of unanswered issues and unreviewed and unmerged pull requests.

** Caveat **

There's a small chance that when more people are involved there's a bit of
diffusion of responsibility (worth googling and reading about if you haven't
heard the term before).

### Reviewing/Merging Pull Requests

In general:

- Avoid merging your own pull requests (but it's fine if it's really simple).
- If the change is significant, get a second opinion.
- If it's insignificant or simple or uncontroversial, go ahead and merge.
- If nobody else responds within a certain amount of time, go ahead and merge
  it anyway, if you feel like it's good enough (we can always fix things
  later).

Many maintainers have mentioned that they like to get a second pair of eyes
even for simple fixes, because it's so easy to for typos and really silly
things to slip in.

### Use Branches (Probably, Mostly)

Even for simple fixes (documentation, typos) branches let others see what's
going on in the repository. If it's insignificant, go ahead and merge it
yourself.

Sometimes it's just silly to create a branch. In that case, go ahead and put
it in master, unless there's a track-level policy about not doing that.

### Claiming Issues

When you start working on an issue, claim it (either assign it to yourself
or just add a comment that you're taking it).

If you have a big list of similar, related things, it's fine to create
a single issue with a todo list, and people can claim individual things
in the comment thread.

### Implementing / Reviewing New Exercises

The tracks should implement the exercise idiomatically in the language
at hand, without veering too far from the README as described (does expanding
the exercise introduce new ideas or just add more work? Is this better off
treated as a new, separate exercise?).

If there are interesting corner cases, then these should be added to the
README, they help make the discussions better.

Exercises should not enforce a single way to solve the problem, if possible.
The more interesting exercises allow several approaches, and create rich
opportunities for discussing trade-offs when people submit their solutions.

### Skipping Uninteresting Exerices

Don't be afraid to 'forego' exercises that don't make sense in the language,
or that are not particularly interesting.

## Useful Tidbits

Here are a few bits and pieces that are referenced from some of the
scenarios in this guide.

### Pull Request Guidelines

1. Put the name of the exercise in the subject line of the commit.
   E.g. `hamming: Add test case for strands of unequal length`
1. Don't submit unrelated changes in the same pull request.
1. If you had a bit of churn in the process of getting the change right,
   squash your commits.
1. If you had to refactor in order to add your change, then we'd love to
   see two commits: First the refactoring, then the added behavior. It's
   fine to put this in the same pull request, unless the refactoring is
   huge and would make it hard to review both at the same time.

Once you've submitted a pull request, one or more of the track maintainers
will review it. Some tracks are less active and might not have someone
checking in every day. If you don't get a response within a couple of days,
feel free to ping us in the [support
chat](https://gitter.im/exercism/support).

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

### Anatomy of an Exercise

TODO: expand on notes below.

#### README

TODO

#### Test Suite

TODO

#### Supporting Files

TODO (boilerplate, header files, etc)

#### Reference Solution

The reference solution is named something with `example` or `Example` in the path.

The solution does not need to be particularly great code, it is only used to verify
that the exercise is coherent.

If you change the test suite, then make sure the reference solution is fixed
to pass the updated tests.

### Track-Level Linting With Configlet

TODO

### et cetera

TODO: add more sections:

- how to squash commits
- how to rebase commits in a branch
- how to merge something locally (for example when there are conflicts, or
  if you want to fix a small thing without nagging the contributor about it)
- good commit messages
    - http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
    - https://www.youtube.com/watch?v=8YjSty6bfog Do your commit messages suck?
- Git Ages 4 and Up (video) https://www.youtube.com/watch?v=1ffBJ4sVUb4
