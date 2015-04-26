---
title: "Understanding PATH"
slug: "understanding-path"
category: "topics"
ordinal: 1
---

## Understanding PATH

The `PATH` environment variable is how your computer decides where to look for a program when you call it on the command line.

For example, take the command:

```bash
ruby bob_test.rb
```

This is a command to your computer to go use the program named `ruby` to execute the file named `bob_test.rb`.

The problem your computer is left with is _How does it know where the `ruby` program lives?_ It can't just go looking through every single directory on your computer, that would take forever. This is where the `PATH` comes in.

`PATH` is a piece of knowledge that your computer keeps easily available.  `PATH` works similarly on Linux, MacOS and Windows, with some minor differences in syntax on Windows.

Check out [explainshell.com](http://explainshell.com/), which provides an interactive explanation.

### Linux or MacOS

Go ahead and check what your path is now by opening your terminal and typing:

```bash
$ echo $PATH
```

It might look something like this:

```plain
/Users/yourname/.gem/ruby/1.9.3/bin:/opt/rubies/ruby-1.9.3-p392/lib/ruby/gems/1.9.1/bin:/opt/rubies/ruby-1.9.3-p392/bin:/Users/yourname/.gem/ruby/1.9.3:/Users/yourname/bin:/usr/local/bin:/usr/bin:/usr/local/share/npm/bin:/usr/local/go/bin:/Users/yourname/code/go/bin:/bin:/usr/sbin:/sbin:/usr/texbin
```

That's essentially a big list of places that your computer will look for programs to run. Each location on your computer is separated from the next with a `:`. When you call `ruby bob_test.rb` the computer looks at the first place, and if it finds a program named `ruby`, fine. It will run it. If not, it will go to the second place and try again. And so on and so forth, until it either finds the program, or runs out of places to look.

If it runs out of places to look without having found the program, it will complain:

```plain
-bash: ruby: command not found
```

You will need to put the `exercism` command-line client in a location that your computer knows to look for it.

It doesn't have to be a place that your computer already knows about. You can create a new directory and tell the computer that it should look there.

On my system I have a directory in my home directory `~/bin` which I use to stick random binaries that only I want to use.

To add this directory to my path, I open up the configuration file for my shell. I find this in my home directory. I can go to my home directory by typing `cd` with no arguments (Mac and Linux):

```bash
$ cd
```

The configuration file could be named any number of things, but typically if you are using bash it is named `.bash_profile`, and if you're using `zsh` it is named `.zshrc`.

To add it to your path, open up the config file and add this line to it:

```bash
export PATH=~/bin:$PATH
```

That means _Store this new PATH by taking the old path and sticking my custom directory in front of it_.

Now the computer needs to load the new configuration. You can do that either by closing the terminal window and opening it again, or by typing:

```bash
. .bash_profile
```

Notice the first dot.

### Windows

Go ahead and check what your path is now by opening a command-line prompt and typing:

```plain
> echo %PATH%
```

It might look something like this:

```plain
C:\windows\system32;C:\windows;C:\windows\System32\Wbem;C:\windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\TortoiseHg\;C:\Program Files\TortoiseSVN\bin;C:\Python27;C:\Python27\Scripts;C:\Program Files\TortoiseGit\bin;C:\Program Files (x86)\nodejs\;c:\Program Files (x86)\Git\bin;C:\Program Files (x86)\CMake 2.8\bin 
```

That's essentially a big list of places that your computer will look for programs to run. Each location on your computer is separated from the next with a `;`. When you call `ruby bob_test.rb` the computer looks at the first place, and if it finds a program named `ruby`, fine. It will run it. If not, it will go to the second place and try again. And so on and so forth, until it either finds the program, or runs out of places to look.

If it runs out of places to look without having found the program, it will complain:

```plain
> ruby bob_test.rb
'ruby' is not recognized as an internal or external command,
operable program or batch file.
```

You will need to put the `exercism.exe` command-line client in a location that your computer knows to look for it.

It doesn't have to be a place that your computer already knows about. You can create a new directory and tell the computer that it should look there.

To add a directory to your path, open the System control panel applet, then select "Advanced system settings", then click the "Environment Variables..." button.  Select the `PATH` environment variable in "User variables" if you want to change the setting just for your account or "System variables" if you want to change the setting for all accounts.  Click the "Edit..." button and change the value to include the location of your `exercism.exe` client.  Don't forget the separating `;` character between path entries.

## Still confused?

If you're still confused [post an issue on GitHub](https://github.com/exercism/exercism.io/issues) so that we can help you out. Then we can update this text so that hopefully the next person doesn't get as confused.
