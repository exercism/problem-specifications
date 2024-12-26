# Description

Create an implementation of the atbash cipher, an ancient encryption system created in the Middle East.

The Atbash cipher is a simple substitution cipher that relies on transposing all the letters in the alphabet such that the resulting alphabet is backwards.
The first letter is replaced with the last letter, the second with the second-last, and so on.

An Atbash cipher for the Latin alphabet would be as follows:

```text
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: zyxwvutsrqponmlkjihgfedcba
```

It is a very weak cipher because it only has one possible key, and it is a simple mono-alphabetic substitution cipher.
However, this may not have been an issue in the cipher's time.

Ciphertext is written out in groups of fixed length, the traditional group size being 5 letters, leaving numbers unchanged, and punctuation is excluded.
This is to make it harder to guess things based on word boundaries.
All text will be encoded as lowercase letters.

## Examples

- Encoding `test` gives `gvhg`
- Encoding `x123 yes` gives `c123b vh`
- Decoding `gvhg` gives `test`
- Decoding `gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt` gives `thequickbrownfoxjumpsoverthelazydog`

## Perspective

The atbash cipher is weak because there is no secret key: as soon as you know (or guess) that the text has been encrypted with the atbash cipher, you can immediately decrypt it.

The atbash cipher is an example of a [substitution cipher][sc]; other examples can be found in exercises "rotational-cipher", "simple-cipher" and "affine-cipher".

You can find examples of ciphers based on an different principle, known as [transposition ciphers][tc], in exercises "crypto-square" and "rail-fence-cipher".

All of these ciphers are considered toy ciphers by current standards. However, substitution and transposition (also called permutation) are two building blocks of modern ciphers like [AES][aes].

[sc]: https://en.wikipedia.org/wiki/Substitution_cipher
[tc]: https://en.wikipedia.org/wiki/Transposition_cipher
[aes]: https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
