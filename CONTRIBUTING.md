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
        * [Getting the Code](#getting-the-code)
	* [Branches](#branches)
	* [Commit Messages](#commit-messages)
        * [Resetting `master`](#resetting-master)
        * [Squashing](#squashing)
        * [Resources](#resources)

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
([exercism/x-common](https://github.com/exercism/x-common)).

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

### In exercism/x-common

* Create `exercises/<slug>/description.md` and `exercises/<slug>/metadata.yml`.
* Bonus: `exercises/<slug>/canonical-data.json` with inputs/outputs for the test suite.
* Submit a pull request.

### In exercism/x<TRACK_ID>

* Do the same as when [porting an
  exercise](#porting-an-exercise-to-another-language-track).
  Reference the PR in x-common if it hasn't been merged yet,
  this **must not** be merged until the exercism/x-common PR is merged.

## Track Anatomy

Each track should have the following structure:

```bash
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

The example template for a track can be found at [x-template](https://github.com/exercism/x-template).

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
[email Katrina](mailto:kytrinyx@exercism.io) and she'll set up a new repo for
that language.

Then you can fork and clone per usual.

In order to launch the track needs:

- At least 10 problems implemented.
- A handful of people who can check in regularly and provide feedback on solutions.
- Documentation in `docs/` for how to get started / run the tests

Description of what is required for `docs/` can be found in the [Track Anatomy](#track-anatomy).

Once that is in place, the repository needs to be added as a submodule to
[exercism/x-api](https://github.com/exercism/x-api/tree/master/tracks), and
the `"active"` key in `config.json` must be flipped to `true`.

We don't deploy x-api automatically, so it will go live the next time the submodules
are updated (daily, for the most part).

### Beta-Testing a Language Track
---

For a track that is set as `"active": false` in the `config.json`, `exercism fetch`
will not automatically pull down problems. You can still test the language by
fetching problems directly, e.g.:

```
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

1. Put the name of the exercise in the subject line of the commit.
   E.g. `hamming: Add test case for strands of unequal length`
1. The subject line should be a one-sentence summary, and should not include
   the word *and* (explicitly or implied).
1. Any extra detail should be provided in the body of the PR.
1. Don't submit unrelated changes in the same pull request.
1. If you had a bit of churn in the process of getting the change right,
   squash your commits.
1. If you had to refactor in order to add your change, then we'd love to
   see two commits: First the refactoring, then the added behavior. It's
   fine to put this in the same pull request, unless the refactoring is
   huge and would make it hard to review both at the same time.
1. If you are referencing another issue or pull-request, for instance
   *closes #XXX* or *see #XXX*, please include the reference in the body of the PR,
   rather than the subject line. This is simply because the subject line doesn't
   support markdown, and so these don't get turned into clickable links. It makes
   it harder to follow and to go look at the related issue or PR.
1. Please also refer to the guidelines for [commit messages](#commit-messages).

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

### Track configuration file

Each language track has a configuration file called `config.json`.

Important keys are:
* `problems` - actively served via `exercism fetch`
* `deprecated` - implemented, but aren't served anymore
* `foregone` - will not be implemented in the track
* `ignored` - these directories do not contain problems

The `configlet` tool uses those categories to ensure that

1. all the `problems` are implemented,
2. `deprecated` problems are not actively served as problems, and
3. `foregone` problems are not implemented.

In addition, it will complain about problems that are implemented but are not
listed in the config under the `problems` key. This is where the `ignored` key
is useful. Ignored directories don't get flagged as unimplemented problems.

A problem might be foregone for a number of reasons, typically because it's a
bad exercise for the language.

Optional keys:
* `test_pattern` - A (case sensitive) regex pattern that test filenames will match. It is used to determine which files will be visible on a problem's test-suite page on the exercism.io site. The default value used if this key is not present is `test` (note: this is case _insensitve_)
* `ignore_pattern` - A (case insensitive) regex pattern that will cause files matching it to not be served to the student by `exercism fetch`. The default value used if this key is not present is `example`
* `solution_pattern` - A (case sensitive) regex pattern that matches solution files in the track repository. Used by [configlet](https://github.com/exercism/configlet) to check for the presence of an example solution for each problem implemented by the track.  The default value used if this key is not present is `[Ee]xample`.

### Track-Level Linting With Configlet

If the `config.json` file is incomplete or broken, a lot of other things break.
To make things easier we made a small tool to help verify the config:
https://github.com/exercism/configlet#configlet

You can download the latest release from the releases page in the [configlet
repo](https://github.com/exercism/configlet/releases), or you can use the
`bin/fetch-configlet` command from the root of the language track repository,
which will make a guess at what operating system and architecture you have and
attempt to download the right one.

Verify the config by calling `bin/configlet .` (notice the dot). This says
_check the config of the language track that is stored right here).

### Git Basics

If you're concerned that you haven't done it right, don't worry. Submit your pull request, and we'll help you get the details sorted out.

#### Getting the Code

We recommend forking the project first, and then cloning the fork.

```bash
git clone git@github.com:<YOUR_USERNAME>/<REPO_NAME>.git
```

This will give you a remote repository named `origin` that points to your own copy of the project.

In addition to this, we recommend that you add the original repository as a secondary remote.

```bash
git remote add upstream https://github.com/exercism/<REPO_NAME>.git
```

The names `origin` and `upstream` are pretty standard, so it's worth getting used to the names in your own work.

#### Branches

When working on your fork it tends to make things easier if you never touch the master branch.

The basic workflow becomes:

* check out the master branch
* pull from `upstream` to make sure everything is up to date
* push to `origin` so you have the latest code in your fork
* check out a branch
* make the changes, commit them
* rebase onto the upstream master (and resolve any conflicts)
* push your branch up to `origin`
* submit a pull request

If you're asked to tweak your work, you can keep pushing it to the branch, and it automatically updates the pull request with the new commits.

#### Commit Messages

Commit messages are communication and documentation. They're a log of more
than just _what_ happened, they're about _why_ it was done.

The longer a project is active, the more people involved, the larger the
codebase, the more important it is to have good commit messages.

There's an excellent lightning talk by Ryan Geary called [Do Your Commit
Messages
Suck?](https://www.youtube.com/watch?v=8YjSty6bfog).
It's funny and enlightening, and you should watch it.

Two articles that have very clear guidelines about how to write
excellent commit messages are Tim Pope's
[A Note About Git Commit Messages](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
and Chris Beams' [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/).
Please read them.

##### Examples

Imagine that you're submitting a new problem called "spinning-wheel" to the Ruby track.

Here's a fairly typical set of commits that you might end up making:

```bash
433a0e1 added spinning wheel tests
1f7d4aa pass spinning wheel
cf21737 oops
be4c410 rename example file
bb89a77 update config
```

All of these commits are about a single thing: adding a new problem. They
should be a single commit. They don't have to start out that way (life is
messy), but once you're done, you should squash everything into one commit,
and rename it cohesively:

```bash
f4314e5 add spinning wheel problem
```

#### Resetting `master`

If you've already made changes on your master so that it has diverged from the
upstream you can reset it.

First create a backup of your branch so that you can find any changes. Just in
case.

```bash
git checkout master
git checkout -b backup
git checkout master
```

Next, fetch the most recent changes from the upstream repository and reset master to it.

```bash
git fetch upstream
git reset --hard upstream/master
```

If you do a git log at this point you'll see that you have *exactly* the
commits that are in the upstream repository. Your commits aren't gone, they're
just not in master anymore.

To put this on your GitHub fork, you'll probably need to use the `--force` flag:

```bash
git push --force origin master
```

#### Squashing

Squashing commits into a single commit is particularly useful when the change
happened in lots of little (sometimes confusing) steps, but it really is one
change.

There are a number of ways to accomplish this, and many people like to use an
[interactive rebase](#interactive-rebase), but it can be tricky if you haven't set git up to open
your favorite editor.

An easier way to do this is to un-commit everything, putting it back into the
staging area, and then committing it again.

Using the example from above, we have 5 commits that should be squashed into one.

```bash
433a0e1 added spinning wheel tests
1f7d4aa pass spinning wheel
cf21737 oops
be4c410 rename example file
bb89a77 update config
```

To un-commit them, use the following incantation:

```bash
$ git reset --soft HEAD^^^^^
```

Notice that there are 5 carets, one for each commit that you want to
un-commit. You could also say:

```bash
$ git reset --soft HEAD~5
```

If you do a `git status` now, you'll see all the changed files, and they're
staged and ready to commit. If you do a `git log`, you'll see that the most
recent commit is from someone else.

Next, commit, as usual:

```bash
$ git commit -m "Add spinning wheel problem"
```

Now if you do a `git status` you may get a warning saying that your origin and
your branch have diverged. This is completely normal, since the origin has 5
commits and you have 1 (different) one.

The next step is to force push this up to your branch, which will
automatically update the pull request, replacing the old commits with the new
one.

```bash
$ git push --force origin spinning-wheel
```

#### Resources

If you're completely new to git, there are a number of resources that can help
get you feeling more comfortable with it.

* [Git Immersion](http://gitimmersion.com/)
* [GitHug](https://github.com/Gazler/githug)
* [Try GitHub](http://try.github.io)

If you've been using git for a while, but it feels like repeating magical
incantations (while praying that nothing goes wrong), then you may find these
helpful:

* [Git for Ages 4 and Up](https://www.youtube.com/watch?v=1ffBJ4sVUb4) - video of a presentation/demo
* [Think Like a Git](http://think-like-a-git.net/)
* [Explain Git with D3](http://www.wei-wang.com/ExplainGitWithD3) - interactive site
* [Pro Git](http://git-scm.com/book/en/v2) - "The Book" for learning Git in detail
* [Git Branching Tutorial](http://pcottle.github.io/learnGitBranching/) - interactive tutorial, very visual

#### Rebasing

You'll often be asked to rebase your branch before we merge a pull request as Exercism likes to keep a linear project commit history. This is accomplished with git rebase. It takes the current branch and places all the commits at the front of the branch that you're rebasing with.

For example, rebasing the current branch on top of upstream/master:
```
 git rebase upstream/master
```
Project commit history:
```
                       -- current branch --
                      /
--- master branch ----
```

##### Interactive Rebase
The rebase command has an option called `-i, --interactive` which will open an editor with a list of the commits which are about to be changed. This list accepts commands, allowing the user to edit the list before initiating the rebase action.

Using the example from above, we have 5 commits that should be squashed into one.

```bash
433a0e1 added spinning wheel tests
1f7d4aa pass spinning wheel
cf21737 oops
be4c410 rename example file
bb89a77 update config
```

To interactively rebase, use the following incantation:

```bash
$ git rebase -i HEAD~5
```
This will bring up an editor with the following information:

```bash
pick 433a0e1 added spinning wheel tests
pick 1f7d4aa pass spinning wheel
pick cf21737 oops
pick be4c410 rename example file
pick bb89a77 update config

#
# Commands:
#  p, pick = use commit
#  r, reword = use commit, but edit the commit message
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#  f, fixup = like "squash", but discard this commit's log message
#  x, exec = run command (the rest of the line) using shell
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

By choosing the `reword` command for the top commit and choosing the `fixup` command for the remaining commits, you will be able to squash the commits into one commit and provide a descriptive summary of the entire change

```bash
reword 433a0e1 added spinning wheel tests
fixup 1f7d4aa pass spinning wheel
fixup cf21737 oops
fixup be4c410 rename example file
fixup bb89a77 update config
```

[Further Reading](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)

### et cetera

TODO: add more sections:

- how to merge something locally (for example when there are conflicts, or
  if you want to fix a small thing without nagging the contributor about it)
