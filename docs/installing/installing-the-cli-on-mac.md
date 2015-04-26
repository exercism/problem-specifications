---
title: "Installing the CLI on Mac OS X"
slug: "installing-the-cli-on-mac"
category: "process"
ordinal: 3
---

There are a few options available to you for installing the CLI on a Mac.

1. You can download the [latest release](http://github.com/exercism/cli/releases/latest) for your operating system and architecture (32-bit or 64-bit), unzip it, and place the binary [in your PATH](/understanding-path.html).
1. You can use the [installation script](https://raw.githubusercontent.com/exercism/cli-www/master/public/install) which is the same thing as above, except automated.
1. You can use [homebrew](http://brew.sh/).

## Manual Installation

This is described in detail in [this video tutorial](https://www.youtube.com/watch?v=TCT4eHGwfaE).

If you have neither `curl` nor `wget` then you'll need to [get the latest release](https://github.com/exercism/cli/releases/latest) from GitHub.

To figure out which processor architecture your computer has, open Terminal.app and type in the following command:

```bash
uname -m
```

Common values are `i386` (32-bit) and `x86_64` (64-bit).

**TODO: step-by-step instructions here**

## Installation Script

Open up Terminal.app. You should be able to find this using the Spotlight search, or by going to _Applications > Utilities > Terminal_.

### Option 1: curl

First, find out if you have `curl` installed:

```bash
curl -V
```

If you have `curl` it will give output a version number and some other stuff (if not, it will probably say "command not found").

To download the script using `curl`, run the following command:

```bash
curl -O https://raw.githubusercontent.com/exercism/cli-www/master/public/install
```

### Option 2: wget

If you don't have `curl`, then check if you have `wget`:

```bash
wget -V
```

Again, a version and some other stuff means that you have it, and "command not found" means that you don't.

If you have it, download the script with the following command:

```bash
wget https://raw.githubusercontent.com/exercism/cli-www/master/public/install
```

In general, you don't ever want to run a script that someone else wrote without reading it yourself. Bad things can happen. In this case, the script is innocuous, but don't take my word for it. Open up the script and read it yourself. You can do this using your favorite text editor, or with the `open` command, which will default to TextEdit:

```bash
open install
```

## Running the Install Script

Now you'll need to make the script executable. Run the following command:

```bash
chmod +x install
```

**NOTE**: If you want to learn more about PATH, and what _making a file executable_ actually means, check out [Jumpstart Lab's CLI tutorial](http://tutorials.jumpstartlab.com/topics/cli.html).

Now, finally, run the script.

```bash
./install
```

By default, the installer will try to put it in `/usr/local/bin/` or `$HOME/bin/`.

If you'd like it to live somewhere else, you can specify it up front:

```bash
DIR=/path/to/bin ./install
```

If everything worked, you should be able to run exercism:

```bash
exercism -v
```

To see all the commands available to you, run `exercism` without any options:

```bash
exercism
```

## Homebrew

You'll need to get access to the homebrew/binary repository, then use `brew install` as usual:

```bash
brew tap homebrew/binary
brew install exercism
```

The homebrew version of exercism will often lag a bit behind for a few days after a new release has been made, since it requires a pull request to be accepted into the homebrew-binary project before it's available.

<a class="secondary-button" href="fetching-exercises.html">Fetching Exercises</a>
