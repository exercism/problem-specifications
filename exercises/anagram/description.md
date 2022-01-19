# Description

An anagram is a rearrangement of letters to form a new word:
for example `"owns"` is an anagram of `"snow"`.  A word is
not its own anagram: for example, `"stop"` is not an anagram
of `"stop"`.

Given a target word and a list of candidate words, this
exercise requests the anagram list: the sublist of the
candidates that are anagrams of the target.

The target and candidates are words in ASCII alphabetic
characters (`A`-`Z` and `a`-`z`). Lowercase and uppercase
characters are equivalent: for example, `"PoTS"` is an
anagram of `"sTOp"`. The candidate set is represented as an
unordered list. The anagram set must be the sublist of all
anagrams in the candidate set (in the same order).

Given the target `"stone"` and candidates `"stone"`,
`"tones"`, `"banana"`, `"tones"`, `"tons"`, `"notes"`, `"Seton"`, the
anagram list is `"tones"`, `"tones"`, `"notes"`, `"Seton"`.
