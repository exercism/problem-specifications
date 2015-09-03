Given a string `filename` and regular expression `pattern`, collect and
return the line numbers and contents of all lines in the file denoted by
`filename` that match `pattern`.

In other words, solutions should open the file described by `filename`
and read each of its lines while keeping track of line numbers (starting at 1).
If a line matches `pattern`, create a pair containing the line's
number and the line itself.
After reading the entire file, return a list of all such pairs sorted
from lowest line number to highest.

The name "grep" comes from the [Unix program](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/grep.html) with the same name.
(In Unix, "grep" was a mnemonic for a useful command to another program [sed](http://www.gnu.org/software/sed/manual/sed.html), whose name means "stream editor".)

The Unix `grep` can be run from the command line and accepts a variety of flags.
Try reproducing some of these in your implementation. For example:
- Accept a pattern and list of files on the command-line, print results
  for each file to the console.
- Implement the flags:
  - `-l` Print only the names of files that contain at least one matching line.
  - `-v` Invert the program -- collect all lines that fail to match the pattern.
  - `-x` Only match entire lines, instead of lines that contain a match.
- Support multiple flags at once.
  For example, running `grep -l -x "hello" file1.txt file2.txt` should
  print the names of files that do not contain the string "hello"
