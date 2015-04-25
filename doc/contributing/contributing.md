# Contributing

This contributing guide pertains to contributing to exercism problem sets
in individual languages, as well as the exercism Problem API (x-api),
which is a small application that delivers the problems in all of the
languages.

The problem API includes each of the language repositories as a git submodule.

Submodules can be a bit tricky to work with, but in this case it's worth it,
since contributing to a language track can be done with no dependencies on
other languages.

**You don't need to have a working Ruby development environment to contribute
problems in Haskell or Erlang!**

### Table of Contents
* [Abstractions](#abstractions)
* [Code Arrangement](#code-arrangement)
* [config.json](#configjson)
* [configlet](#configlet)
* [SETUP.md](#setupmd)
* [Existing Language Tracks](#existing-language-tracks)
* [New Language Tracks](#new-language-tracks)
* [Problem Sets](#problem-sets)
* [Metadata](#metadata)
* [CLI](#cli)
* [Problem API](#problem-api)


### Abstractions

The core ideas in the codebase are:

* [Progression](lib/xapi/progression.rb) - a complete list of all the problems currently available for
  a language, in the order that they will be delivered by default. This is
  based on the contents of the `EXERCISES.txt` file in the language-specific
  repository.
* [Problem](lib/xapi/problem.rb) - the basic unit of work in exercism. It is in a given language,
  and has a `slug` that identifies it.
  An exercise consists of a `Readme` and `Code`.
* [Readme](lib/xapi/readme.rb) - a language-independent explanation of the problem to be solved.
* [Code](lib/xapi/code.rb) - supporting code to solve the problem. In its most basic form, it
  consists of a test suite, but there can be other supporting files (class
  or type definitions, metadata files, etc).

There is also the concept of `Homework` which wraps the process of getting
a user's current exercise set from exercism.io, and getting all the relevant problems.

**NOTE** A _problem_ is a README and test suite/supporting code (language+slug). An _exercise_ is a problem worked by a user.

### Code Arrangement

The sinatra app lives in `lib/app`, and the business logic lives in
`lib/xapi`. To determine whether something is business logic or web
application logic, think about whether or not a different interface (say,
perhaps a command-line interface) would also need that behavior.

The tests live under `test`, and the path to the test file will mirror the
path to the code file, except with `test` rather than `lib`:

```bash
lib/app/routes/demo.rb
test/app/routes/demo_test.rb
```

There could be exceptions to this, but they are rare.

### config.json

There are a number of keys in the `config.json` of each language repository.

* `problems` - these are actively served via `exercism fetch`
* `deprecated` - these were implemented, but aren't served anymore
* `foregone` - these must not be implemented in this language
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

### configlet

If the `config.json` file is incomplete or broken, a lot of other things break.
To make things easier we made a small tool to help verify the config:
https://github.com/exercism/configlet#configlet

You can download the latest release from the releases page in the [configlet
repo](https://github.com/exercism/configlet/releases), or you can use the
`bin/fetch-configlet` command from the root of the language track repository,
which will make a guess at what operating system and architecture you have and
attempt to download the right one.

Then, verify the config by calling `bin/configlet .` (notice the dot). This says
_check the config of the language track that is stored right here_.

### SETUP.md

Each language track may optionally contain a SETUP.md file in the root of
the repository. This file should contain helpful, generic information about
solving an exercism problem in the target language.

The contents of the SETUP.md file gets included in the README.md that gets
delivered along with the test suite and any supporting files when a user runs
the `exercism fetch` command from their terminal.

At the very minimum, it should contain a link to the relevant
language-specific documentation on
[help.exercism.io](http://help.exercism.io).

It would also be useful to explain in a generic way how to run the tests.
Remember that this file will be included with _all_ the problems, so it gets
confusing if we refer to specific problems or files.

Some languages have very particular needs in terms of the solution. For
example, in Java, the solution is expected to go into the `src/main/java/`
directory.

If a language track has specific expectations, these should also be documented
here.

## EXISTING LANGUAGE TRACKS
### Viewing Available Language Tracks

To get a quick overview of which language tracks exist you can look at the
[problems directory](https://github.com/exercism/x-api/tree/master/problems)
in this repository (x-api).

To see which problems have been implemented in which language, check out the
[synopsis](http://synopsis.exercism.io/) minisite.

### Contributing to an Existing Language Track

Each language has its own repository, in the exercism GitHub organization. It
is named `x<language>`, e.g.

* [exercism/xelixir](https://github.com/exercism/xelixir)
* [exercism/xpython](https://github.com/exercism/xpython)

You can also navigate to each language repository from this repository via the
`problems` directory at the root of the repository. Each entry there is a link to
the relevant submodule's repository.

**If there are any special considerations when contributing to a language,
then these will be listed in the README for that specific repository.**

Each problem consists of:

* a test suite
* an example solution
* supporting files (optional)

The test suite forms the basis for the problem. The example solution will
_not_ be delivered as part of the problem, and is simply used as a sanity
check to make sure that the test suite makes sense.

In some language tracks the test suite is run against the example solution as
part of the CI process.

Supporting files could be anything from additional documentation
(`../getting-started.md`) or type definitions or helpful/boring/necessary
boilerplate.

## NEW LANGUAGE TRACKS
### Contributing a New Language Track

If you're interested in adding problems for a language that we don't yet have,
[email me](mailto:kytrinyx@exercism.io) or [tweet at me](https://twitter.com/kytrinyx)
and I'll set up a new repo for that language.

Then you can fork and clone per usual.

Each language will need at least 10 problems in order to launch, as well as a
small handful of people who can kick off the nitpicking. These people should
have a good grasp of the styles and idioms in use in that language.

In addition to a problem set and some initial mentors, we also need:

1. A help topic: [`app/pages/languages/getting-started-with-$LANGUAGE.md`](https://github.com/exercism/docs/tree/master/app/pages/languages)
1. (maybe) an addition to the [exercism CLI](https://github.com/exercism/cli)
that instructs the cli application how to recognize test files to prevent
people from accidentally submitting tests as solutions.

Provided that I've remembered to add the language as a submodule to the x-api
repository, activating a language is as simple as setting `active` to `true`
in the `config.json`. Then the next time that I update the submodules (more
or less daily) it will be available via the `exercism` CLI.

### Beta-Testing a Language Track

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

## PROBLEM SETS

### Problem Data

The supporting code for a given problem can be found in language-specific
subdirectories under the `problems` directory.

Each language-specific directory is a git submodule. If you wish to make
changes to a problem, look for the corresponding repository on GitHub under
`exercism/x{LANGUAGE_NAME}`.

So, for example, the Scala examples can be found in this repository:

```bash
$ ls problems/scala
```

The corresponding git repository is at
[github.com/exercism/xscala](https://github.com/exercism/xscala).

The READMEs are constructed using shared metadata in the `metadata` directory.
This is also a git submodule, and if you wish to make changes to it, the codebase
can be found on GitHub under [exercism/x-common](https://github.com/exercism/x-common).

### Contributing to Existing Problems

To contribute to an existing problem, fork, fix, and submit a pull request as
usual.

It helps very much if the commit message contains the name of the problem,
e.g.

```plain
Clarify failure output in queen-attack
```

If you have fixes for more than one problem, please use branches and submit
multiple pull requests. This lets us merge simple and uncontroversial pull
requests quickly, while leaving the option open to ask for improvements and
have discussions in others.

If you have a global change, for example normalizing whitespace in all the
problems, then it's fine to submit that in a single pull request.

### Submitting New Problems

A problem must have a unique slug. This slug is used as

* the directory name within each language-specific repository
* the basename for the metadata files
* the entry in `config.json`

When creating a new problem there are a few things to keep in mind.

1. The metadata needs to exist in the exercism/x-common repository.
1. The problem needs an example solution.
1. The problem slug must be added to the `config.json`.

If you are adding an exercise that already exists in another language, then
the metadata files will already be present.

The example solution's file should contain the word `example` or `Example` in
it, to avoid delivering it as part of the problem.

The example is not shown to people, it doesn't have to be beautiful code, it's
just there to make sure that the test suite works.

CI runs a sanity check on the `config.json` using the `configlet` tool.
Download the archive for your platform and architecture from the [latest
release](https://github.com/exercism/configlet/releases/latest), unpack the
archive into your path.

To run the tool, call `configlet .` from the root of the repository of the
language track, or from elsewhere you can call it with the path to the
repository (e.g. `configlet /home/you/code/exercism/haskell`)

An exercise may have supporting files, such as type definitions.

### Nitpicking a Problem You Created

Once you've created a problem, you'll probably want to provide feedback to people who
submit solutions to it. Once the problem goes live, you can fetch it using the CLI:

```bash
$ exercism fetch <language> <problem>
```

Then submit the example solution that you wrote when creating the problem. This makes
the problem available to you in the nitpick menu.

Remember to mark it with "OK, I'm done" if you don't want other people to comment on it.

## METADATA
### Contributing to Metadata

The problem metadata is shared between all of the languages. This also lives
in a separate repository (http://github.com/exercism/x-common), and is a
collection of yaml, markdown, and json files. There are no development
dependencies whatsoever in this repository, it's all just plain text.

There are three metadata files that go in the
[x-common](https://github.com/exercism/x-common) repository.

* `<slug>.yml` - contains `blurb`, `source`, and `source_url`
* `<slug>.md` - contains the long-form description of the exercise
* `<slug>.json` - contains standard test data for the exercise

The .md and .yml are sewn into a README that gets delivered with the exercise.
The .json can be used as a source of test cases for the test program.
See
[exercism/x-common/README.md](https://github.com/exercism/x-common/blob/master/README.md)
for more details of the .json file.

The `<slug>.md` for each problem should contain a high-level, generic
description of the problem.

It should avoid specifics about data-structures, edge-cases, and error
handling, since each language track can choose to handle these things quite
differently.

## CLI
### Using the CLI Locally

The `~/.exercism.go` configuration file for the CLI contains a field
'hostname' which defaults to 'http://exercism.io'.

To reconfigure the CLI to talk to your local development environment, either
edit file directly, or use the `configure` command:

    exercism configure --host='http://localhost:4567'

If you are also serving exercises locally via the `x-api` app, you can configure
your local exercism.io app to talk to the problems api by exporting an environment
variable:

```bash
$ export EXERCISES_API_URL=http://localhost:9292
```
