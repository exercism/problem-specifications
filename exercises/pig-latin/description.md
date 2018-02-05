Implement a program that translates from English to Pig Latin.

Pig Latin is a made-up children's language that's intended to be
confusing. It obeys a few simple rules (below), but when it's spoken
quickly it's really difficult for non-children (and non-native speakers)
to understand.

* **Rule 1**: If a word begins with a vowel sound, add an "ay" sound to
  the end of the word. Treat "xr" and "yt" at the beginning of a word as vowels ("xray" -> "xrayay").
* **Rule 2**: If a word begins with a consonant sound, move it to the
  end of the word, and then add an "ay" sound to the end of the word.
* **Rule 3**: If a word starts with the following consonant clusters "ch", "qu", "th", "thr", "sch" and any consonant followed by "qu" at the beginning of the word, move it to the end of the word, and then add an "ay" sound to the end of the word (e.g. "chair" -> "airchay", "square" -> "aresquay", "thread" -> "eadthray").
* **Rule 4**: If "y" comes as the beginning of the word then it must be treated as a consonant, and if it comes after a consonant cluster or is the second letter in a two letter word it must be treated as a vowel.

There are a few more rules for edge cases, and there are regional
variants too.

See <http://en.wikipedia.org/wiki/Pig_latin> for more details.
