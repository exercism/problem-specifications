---
title: "Installing the CLI"
slug: "installing-the-cli"
category: "process"
ordinal: 1
---

You access the exercises via the command line using a stand-alone binary. You can install it without installing any particular programming language or environment (imagine having to install Ruby just so you could solve problems in Haskell, or Java just so you can work in Ruby... what a nightmare).

For the most up-to-date binary, your best bet is to get it from the [release on GitHub](https://github.com/exercism/cli/releases/latest).

Find the binary that is named for the platform you are using (mac, windows, linux), and that matches your architecture (32-bit or 64-bit).

## OS X

To figure out which processor architecture your computer has, open Terminal.app and type in the following command:

```bash
uname -m
```

Common values are `i386` (32-bit) and `x86_64` (64-bit).

For more options and more detailed instructions, see the [installing the CLI for Mac OS X](/installing-the-cli-on-mac.html) page.

## Linux

If you're unsure what archicture your processor has, the command `uname -m` should tell you.

For more options and more detailed instructions, see the [installing the CLI for Linux](/installing-the-cli-on-linux.html) page.

## Windows

It's a bit trickier to determine whether you have a 32-bit or 64-bit installation of Windows. Here's a video that [explains how for Windows 7](https://www.youtube.com/watch?v=R9Y9yuXA-qA).

For detailed instructions, see the [installing the CLI for Windows](http://help.exercism.io/installing-the-cli-on-windows.html) page.
