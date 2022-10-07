# Description

Count the frequency of letters in texts using parallel computation.

Parallelism is about doing things in parallel that can also be done
sequentially. A common example is counting the frequency of letters.
Create a function that returns the total frequency of each letter in a
list of texts and that employs parallelism.

Uppercase letters count towards their lowercase equivalent.  Support
at least the extended Latin character set, so that unicode "ü" is
counted separately from "u".  Punctuation and whitespace are ignored.
