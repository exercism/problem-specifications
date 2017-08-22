We have two sequences of DNA, and we need to find the longest subsequence common to both sequences. It differs from problems of finding common substrings: unlike substrings, subsequences are not required to occupy consecutive positions within the original sequences.
Example: The longest subsequence common to 'ACACG' and 'TAGAG' is 'AAG'

If there is more than one subsequence of the same length, we look for the one that begins earlier in the first string.
Example: The subsequence for 'GAC' and 'AGCAT' must be 'GA' (not 'GC', not 'AC')
