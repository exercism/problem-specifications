# Workflow templates

This document explains how to set up Continuous Integration (CI) workflows for an Exercism Language Track using GitHub Actions (GHA). It provides best practices and examples for you to use to make your own fast, reliable and robust CI workflows. The GHA workflows in this folder can be adapted to work with any CI, because the base structure will remain the same.

It will:

- Outline the ideal CI workflow
- Discuss considerations and recommendations
- Provide you with some templates to use
- Leave you with a guide to migrating from Travis

_Note: The content in this folder doesn't **necessarily** belong in this repository, but we don't have a great place to put it that allows for good discoverability. _

Example implementation of these workflow files [can be found in `exercism/javascript`][git-javascript].

## **HELP**: this looks like _a lot_ of work :sweat:

The rest of the document is designed to explain how the workflows work. If you're in a hurry, and you just want to switch from Travis or Circle to GHA without optimizing the PR scripts, scroll down to the **~10 minute guide** on [**Migrating from Travis**](#migrating-from-travis).

## Track CI actions

The recommended actions for checking the content of your repository has integrity are as follows:

1. [`configlet` linting][git-configlet] in order to check `config.json`
2. check for stubs
3. check for documentation (`v3` requires new files; this might move to `configlet`)
4. lint the exercises using a "maintainers" configuration
5. test the exercises using the example/examplar files (can include build step)

There can also be track-specific actions. For example:

1. check the [integrity][wiki-integrity] of the exercise configurations
2. check the formatting of the exercise files

And perhaps you'd want more Quality Of Life checks, such as:

1. ensure CONTRIBUTING exists
2. ensure there is a sane lockfile for dependencies
3. ensure links inside markdown files are valid
4. ...

## Recommendations

### Frequency of running checks

For each action think about how often it should run.

- The `configlet` linting is something that's so important (because a track can break if the `config.json` breaks) that it should probably always run, **but** only needs to run once per commit.
- The existence or integrity of files only needs to run once per commit.
- If a track is supposed to run under multiple runtime-versions or compiler-versions, building/testing exercises should be ran against each supported version
- PRs _probably_ only need to run actions on files _added_ or _changed_, but since a file can influence an exercise, it's safer to run the actions for the _exercise_, if one of its files changes.

It can be very helpful to make the actions that should run, available locally as well. This means that the scripts that do the actual work are also manually runnable. To achieve this **do not inline** the action inside the workflow files., but create a standalone script. For example, checking for stubs can be completely bashed out inside the workflow file, but the recommendation here is to create a new executable script `scripts/ci-check` instead.

> "But the command is very short, e.g. `eslint . --ext ts --ext tsx`".
>
> When this command needs to be updated, it now needs to update in all the places in the documentation, the workflow files, ánd in the _minds of the maintainers_. Extracting this to a script resolves all that. Reading a workflow file can also be **very** daunting.

### Checks on PRs where exercises change

The `scripts/pr` and `scripts/pr-check` scripts (see [templates](#templates)) are run with multiple arguments, one for each file that has been changed or added in this PR. For example, if `two-fer` has been updated, a call might look like this:

```bash
scripts/pr exercises/two-fer/README.md exercises/two-fer/.meta/example.ext
```

It's recommended to run any actions against the changed _exercise_ and not the changed _file_. This is because changing a file is likely to trigger changes for the entire exercise (think: configuration, packages).

> **Not ready?** / **Complex?**
>
> Before implementing this optimization, it may be safely ignored! The migration guide hints at adding at a later stage. If the input arguments are ignored, all the checks will run on all the exercises. **This is perfectly fine**. It will just take longer.

### Integrity checks

If the track has a single "top-level" dependency file and/or other configuration files, add an [integrity][wiki-integrity] step (that exists alongside a `scripts/sync` or `bin/sync`, which would copy all configuration files to all exercises), which ensures that the top-level/base files are the same as the one copied to the exercise directories. Now dependencies can be updated, synced across the repository, and we can ensure that all exercises have the same configuration.

A common way to accomplish this is to use a checksum. Ubuntu (and various other Linux distributions) comes with a tool called `sha1sum`, but using _whichever_ method to hash or reduce the configuration file (md5, sha1, crc32) to a checksum value, would work:

```bash
$ sha1sum README.md
cd58091c5043bf21f00d39ff1740d8b2976deeff *README.md
```

### Security checks

If the track uses additional workflows that require access to the GitHub token or other secrets, it's best practice to pin **all** actions used in the workflow to a specific commit. See [GitHub's security hardening guide][github-actions-security] for details.

For example:

```diff
- uses: julia-actions/setup-julia@v1
+ uses: julia-actions/setup-julia@d26d1111976eae5f00db04f0515ab744ec9cd79e # 1.3.1
```

If the tooling has lockfiles for dependency management, consider checking it into the repository and use a "frozen lockfile" inside the workflow files. For example: `npm ci`, `yarn install --frozen-lockfile` and `bundle install --frozen`. This ensures that the lockfile is up-to-date when changing dependencies and prevents malicious packages to come in.

## Templates

In this directory at minimum there are the following templates:

- `configlet.yml`: This workflow will do a fetch the latest configlet binary and lint this repository. Run on every commit. For PRs, runs on the actual commit and a "after merge" tree.
- `ci.yml`: This workflow **only runs on the main branch**, once on each commit.
  1. Run a 'pre-check' command (check for stubs, lint, docs, etc.) for all exercises
  2. Run a 'ci' command (build and test) for multiple versions, for all exercises
- `pr.ci.yml`: This workflow **only runs on PRs**, once on each commit.
  1. Run a 'pre-check' command (check for stubs, lint, docs, etc.) for changed files
  2. Run a 'ci' command (build and test) for multiple versions, for changed exercises

The non-pr workflows can also be triggered via [`workflow_dispatch`][github-workflow-dispatch].

Each file has listed at the top which "scripts" should be available. If you want these to be binaries, replace `scripts/xxx` with `bin/xxx`. Some tooling will _require_ binaries to be inside a `bin` folder.

- `scripts/ci`: a script that should build and test all exercises using the example solutions against the tests
- `scripts/ci-check`: a script that should lint all exercises, and optionally check for stubs, configuration integrity, and more
- `scripts/pr`: same as `scripts/ci`, but should only run exercises resolved from the paths given as input
- `scripts/pr-check`: same as `scripts/ci-check`, but should only run for files or exercises resolved from the paths given as input

## Migrating from Travis

Here is an example `.travis.yml` (taken from the `elm` track):

```yml
sudo: false
language: node_js
node_js:
  - lts/*
script:
  - bin/fetch-configlet
  - bin/configlet lint .
  - bin/build.sh
```

In order to convert this quickly to GitHub Actions, take the following steps:

### Determine the template variables

| variable                    | value                                |
| --------------------------- | ------------------------------------ |
| `<track>`                   | `elm`                                |
| `<image-name>`              | `ubuntu-latest`                      |
| `<action to setup tooling>` | `actions/setup-node@v1`              |
| `<install dependencies>`    | `npm ci` (happens inside `build.sh`) |
| `<code-extensions>`         | `.elm`                               |

> Found the setup action via [this search](https://github.com/actions/?q=setup+node&type=&language=).
> Found the image name by looking at [default distribution for Travis](https://blog.travis-ci.com/2019-04-15-xenial-default-build-environment).

### Determine the steps

- `bin/fetch-configlet`: don't need this anymore when using `configlet.yml` workflow
- `bin/configlet lint .`: don't need this anymore when using `configlet.yml` workflow
- `bin/build.sh`: single script that does everything

### Prepare the "scripts"

This track uses the `bin` folder, so inside the `bin` folder, create the following files:

```bash
# bin/pr
bin/build.sh
```

```bash
# bin/pr-check
echo "No checks yet"
```

```bash
# bin/ci
bin/build.sh
```

```bash
# bin/ci-check
echo "No checks yet"
```

Creating these as _separate_ binaries will allow for optimisation later. No need to in-line anything right now.

### Fill in the templates

Here is the diff for `workflows/ci.yml`.

```diff
# # .github/workflows/ci.yml

  # This workflow will do a clean install of node dependencies and run tests across different versions
  #
- # Replace <track> with the track name
- # Replace <image-name> with an image to run the jobs on
- # Replace <action to setup tooling> with a github action to setup tooling on the image
- # Replace <install dependencies> with a cli command to install the dependencies
- # Replace <code-extensions> with file extensions that should trigger the workflow
- #
- # Find Github Actions to setup tooling here:
- # - https://github.com/actions/?q=setup&type=&language=
- # - https://github.com/actions/starter-workflows/tree/main/ci
- # - https://github.com/marketplace?type=actions&query=setup
- #
  # Requires scripts:
- # - scripts/ci-check
- # - scripts/ci
+ # - bin/ci-check
+ # - bin/ci

- name: <track> / main
+ name: elm / main

  on:
    push:
      branches: [main]
    workflow_dispatch:

  jobs:
    precheck:
-     runs-on: <image-name>
+     runs-on: ubuntu-latest

      steps:
        - uses: actions/checkout@v2
-       - name: Use <setup tooling>
-         uses: <action to setup tooling>
+       - name: Use Node LTS
+         uses: actions/setup-node@v1
          with:
-           # here, use the LTS/stable version of the track's tooling
-           # node-version: 12.x
+           node-version: 12.x

        - name: Install project dependencies
-         run: <install dependencies>
+         run: npm ci

-       - name: Run exercism/<track> ci pre-check (checks config, lint code) for all exercises
-         run: scripts/ci-check
+       - name: Run exercism/elm ci pre-check (checks config, lint code) for all exercises
+         run: bin/ci-check

    ci:
-     runs-on: <image-name>
+     runs-on: ubuntu-latest

      strategy:
        matrix:
-         # here, add all SUPPORTED versions only
-         # version: [10.x, 12.x, 14.x]
+         version: [10.x, 12.x, 14.x]

      steps:
        - uses: actions/checkout@v2
-       - name: Use <setup tooling> ${{ matrix.version }}
-         uses: <action to setup tooling>
+       - name: Use Node ${{ matrix.version }}
+         uses: actions/setup-node@v1
          with:
-           # below: see how to inject the version
-           # node-version: ${{ matrix.version }}
+           node-version: ${{ matrix.version }}

        - name: Install project dependencies
-         run: <install dependencies>
+         run: npm ci

-       - name: Run exercism/<track> ci (runs tests) for all exercises
-         run: scripts/ci
+       - name: Run exercism/elm ci (runs tests) for all exercises
+         run: bin/ci
```

`workflows/pr.yml` has the same changes, with the notable exception of the bash-fu that calls the `pr-check` and `pr` scripts with each changed file as argument:

```diff
# # .github/workflows/pr.yml

# # ...

-       - name: Run exercism/<track> ci pre-check (stub files, config integrity) for changed exercises
+       - name: Run exercism/elm ci pre-check (stub files, config integrity) for changed exercises
          run: |
            PULL_REQUEST_URL=$(jq -r ".pull_request.url" "$GITHUB_EVENT_PATH")
            curl --url $"${PULL_REQUEST_URL}/files" --header 'authorization: Bearer ${{ secrets.GITHUB_TOKEN }}' | \
-             jq -c '.[] | select(.status == "added" or .status == "modified") | select(.filename | match("\\.(<code-extensions>|md|json)$")) | .filename' | \
+             jq -c '.[] | select(.status == "added" or .status == "modified") | select(.filename | match("\\.(elm|md|json)$")) | .filename' | \
-             xargs -r scripts/pr-check
+             xargs -r bin/pr-check

  # ...
```

### Now it should work

This is enough to convert to GitHub Actions, with the possibility to optimise your scripts.

1. From `build.sh`, remove steps that should run only once, and extract them to the `ci-check.sh` and `pre-check.sh` files (hint, you can create `lint.sh`, and call that from both "scripts")
2. To `pr.sh` and `pr-check.sh`, add optimisations that use the input arguments to determine which files or exercises to check.
3. Add additional checks
4. Add documentation how to run checks locally, and what each one tries to accomplish.

## Troubleshooting

If you run into any issues or want someone to review your workflows, please ping the `@exercism/github-actions` team.

> **Changed a top-level file that should trigger a CI run on all exercises**

At moment of writing, `pr.ci.yml` only allows for "extension" testing. Ideally this is updated to trigger always when certain files are changed (for example the binary to run the tests). However, these changes are often infrequent and done by maintainers, that the fact that `ci.yml` runs on main, always, for everything, is probably safe enough.

> **Created a scripts/xxx file on Windows and now it doesn't work on {other OS}**

By default, files created on Windows don't have metadata in the [git-index][git-index] embedded about their executability, because the model for permissions on windows is different. Git, by default, will use the git-index metadata to determine if the file should be executable on POSIX-based systems, and thus make the `scripts/xxx` file NOT executable.

```bash
git update-index --chmod=+x scripts/xxx
git commit -m "Make scripts/xxx executable"
```

[git-configlet]: https://github.com/exercism/configlet#lint
[git-index]: https://www.git-scm.com/docs/git-update-index
[git-javascript]: https://github.com/exercism/javascript/tree/f49ac022d3a55cbbb48dadbc6dbf1d407de72187/.github/workflows
[github-workflow-dispatch]: https://github.blog/changelog/2020-07-06-github-actions-manual-triggers-with-workflow_dispatch/
[github-actions-security]: https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/security-hardening-for-github-actions#using-third-party-actions
[wiki-integrity]: https://en.wikipedia.org/wiki/File_verification
