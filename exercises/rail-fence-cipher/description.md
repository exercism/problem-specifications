# Description

Implement encoding and decoding for the rail fence cipher.

The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which it's encoded.
It was already used by the ancient Greeks.

In the Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zig-zag).
Finally the message is then read off in rows.

For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE", the cipherer writes out:

```text
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .
```

Then reads off:

```text
WECRLTEERDSOEEFEAOCAIVDEN
```

To decrypt a message you take the zig-zag shape and fill the ciphertext along the rows.

```text
? . . . ? . . . ? . . . ? . . . ? . . . ? . . . ?
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```

The first row has seven spots that can be filled with "WECRLTE".

```text
W . . . E . . . C . . . R . . . L . . . T . . . E
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```

Now the 2nd row takes "ERDSOEEFEAOC".

```text
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```

Leaving "AIVDEN" for the last row.

```text
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .
```

If you now read along the zig-zag shape you can read the original message.

## Perspective

This cipher is weak because set the of possible values for the secret key (the number of rails) is very small (no more than the length of the message). Given a message encrypted with the rail fence cipher, you can write a program that tries all possible numbers of rails and prints out all possible plaintexts, one per line. It is then easy to look at the output and identify the line that looks like English. (This could even be automated, for example using a dictionary.)

The rail fence cipher is an example of a [transposition cipher][tc], like the exercise "crypto-square". Other exercises, like "rotational-cipher", "simple-cipher", "atbash-cipher" and "affine-cipher", are examples of [substitution ciphers][sc].

All of these ciphers are considered toy ciphers by current standards. However, substitution and transposition (also called permutation) are two building blocks of modern ciphers like [AES][aes].

[tc]: https://en.wikipedia.org/wiki/Transposition_cipher
[sc]: https://en.wikipedia.org/wiki/Substitution_cipher
[aes]: https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
