Reverse a string

For example:
input: "cool"
output: "looc"

## For bonus points

Did you get the tests passing and the code clean? If you want to, these
are some additional things you could try:

- ASCII, UTF-8 and UTF-16 are 3 common character encodings you are likely to
encounter as a programmer. ASCII is a character encoding published in 1963
designed for representing English language text. UTF-8 and UTF-16 are both
Unicode character encodings. Unicode was first published in 1991 and can now
represent English language text, foreign text, historic text and emojis.

  UTF-8 and UTF-16 both represent English language characters as a single code
unit. But many emoji characters require 2 or more code units.

  Add a test for reversing a string of a couple emoji characters. You may find
that your existing solution has been reversing bytes or code units instead of
characters.

  Here is an example emoji string: 😀☕
  And its reverse: ☕😀

  Note that some languages are not Unicode aware. It is not recommended to try
this challenge if your language does not have good Unicode support.
