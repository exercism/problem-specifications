# Description

Create an implementation of the rotational cipher, also sometimes called the Caesar cipher.

The Caesar cipher is a simple shift cipher that relies on transposing all the letters in the alphabet using an integer key between `0` and `26`.
Using a key of `0` or `26` will always yield the same output due to modular arithmetic.
The letter is shifted for as many values as the value of the key.

The general notation for rotational ciphers is `ROT + <key>`.
The most commonly used rotational cipher is `ROT13`.

A `ROT13` on the Latin alphabet would be as follows:

```text
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: nopqrstuvwxyzabcdefghijklm
```

It is stronger than the Atbash cipher because it has 27 possible keys, and 25 usable keys.

Ciphertext is written out in the same formatting as the input including spaces and punctuation.

## Examples

- ROT5 `omg` gives `trl`
- ROT0 `c` gives `c`
- ROT26 `Cool` gives `Cool`
- ROT13 `The quick brown fox jumps over the lazy dog.` gives `Gur dhvpx oebja sbk whzcf bire gur ynml qbt.`
- ROT13 `Gur dhvpx oebja sbk whzcf bire gur ynml qbt.` gives `The quick brown fox jumps over the lazy dog.`

## Perspective

The rotational cipher is very weak because the number of possible keys is way too small. Given a message encrypted with this cipher, you can write a program that prints all 26 possible plaintexts and look at the list to quickly identify the one that looks like English. (This could even be automated, for example using a dictionary.)

You can find an improvement over this rotational cipher (also called shift cipher) in the exercise "simple-cipher". Other examples of [substitution ciphers][sc] can be found in exercises "atbash-cipher" and "affine-cipher".

You can find examples of ciphers based on an different principle, known as [transposition ciphers][tc], in exercises "crypto-square" and "rail-fence-cipher".

All of these ciphers are considered toy ciphers by current standards. However, substitution and transposition (also called permutation) are two building blocks of modern ciphers like [AES][aes].

[sc]: https://en.wikipedia.org/wiki/Substitution_cipher
[tc]: https://en.wikipedia.org/wiki/Transposition_cipher
[aes]: https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
