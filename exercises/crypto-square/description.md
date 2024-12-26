# Description

Implement the classic method for composing secret messages called a square code.

Given an English text, output the encoded version of that text.

First, the input is normalized: the spaces and punctuation are removed from the English text and the message is down-cased.

Then, the normalized characters are broken into rows.
These rows can be regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence

```text
"If man was meant to stay on the ground, god would have given us roots."
```

is normalized to:

```text
"ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots"
```

The plaintext should be organized into a rectangle as square as possible.
The size of the rectangle should be decided by the length of the message.

If `c` is the number of columns and `r` is the number of rows, then for the rectangle `r` x `c` find the smallest possible integer `c` such that:

- `r * c >= length of message`,
- and `c >= r`,
- and `c - r <= 1`.

Our normalized text is 54 characters long, dictating a rectangle with `c = 8` and `r = 7`:

```text
"ifmanwas"
"meanttos"
"tayonthe"
"groundgo"
"dwouldha"
"vegivenu"
"sroots  "
```

The coded message is obtained by reading down the columns going left to right.

The message above is coded as:

```text
"imtgdvsfearwermayoogoanouuiontnnlvtwttddesaohghnsseoau"
```

Output the encoded text in chunks that fill perfect rectangles `(r X c)`, with `c` chunks of `r` length, separated by spaces.
For phrases that are `n` characters short of the perfect rectangle, pad each of the last `n` chunks with a single trailing space.

```text
"imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
```

Notice that were we to stack these, we could visually decode the ciphertext back in to the original message:

```text
"imtgdvs"
"fearwer"
"mayoogo"
"anouuio"
"ntnnlvt"
"wttddes"
"aohghn "
"sseoau "
```

## Perspective

This cipher is weak because there is no secret key: as soon as you know (or guess) that the text has been encrypted with this cipher, you can immediately decrypt it.

It is an example of a [transposition cipher][tc], like the exercise "rail-fence-cipher". Other exercises, like "rotational-cipher", "simple-cipher", "atbash-cipher" and "affine-cipher", are examples of [substitution ciphers][sc].

Substitution and transposition (also called permutation) are two building blocks of modern ciphers such as [AES][aes].

[tc]: https://en.wikipedia.org/wiki/Transposition_cipher
[sc]: https://en.wikipedia.org/wiki/Substitution_cipher
[aes]: https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
