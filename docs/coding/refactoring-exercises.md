---
title: "Refactoring Exercises"
slug: "refactoring-exercises"
category: "topics"
ordinal: 4
---

Some exercises, such as *ledger*, are refactoring exercises. In a normal
exercise you start with a test suite and have to develop code that passes it. By
contrast in a refactoring exercise you start with both a test suite and
code that passes it. The code that you get however is very ugly. Your job in a
refactoring exercise is to improve the code.

The trick to refactoring is to take small steps and run the tests often. That
way if you break something you'll have an easier time figuring out what you did
wrong.

When you submit a refactoring exercise please add a comment to the submission
listing the refactoring steps you've taken. This will help you get "in the
rhythm" of refactoring. It will also make it easier for nitpickers to follow
what you did.

For example, such a list of steps could look like:

* Split off timestamp calculation into a separate function.
* Created a class for list entries.
* Moved list entry formatting to the ListEntry class.

To help you keep track of your refactoring steps and to make it easier to undo
any mistakes you've made version control systems can come in handy. There are a
bunch of tutorials for git (the most popular version control system) in the
[resources section of the Git Workflow page](git-workflow.html#resources).

Refactoring is sometimes as much of an art as a science. Luckily there are
plenty of good resources on the internet such as:

* [JB Rainsberger, on Where do I start?](http://www.jbrains.ca/permalink/refactoring-where-do-i-start)
* [The C2 Wiki on Refactoring](http://c2.com/cgi/wiki?WhatIsRefactoring)
* [Martin Fowler's catalog of refactorings](http://refactoring.com/catalog/)
* [The Mikado Method](https://pragprog.com/magazines/2010-06/the-mikado-method)
