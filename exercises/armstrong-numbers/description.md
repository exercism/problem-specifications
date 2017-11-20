An [Armstrong number](https://en.wikipedia.org/wiki/Narcissistic_number) is a number that is the sum of its own digits each raised to the power of the number of digits.
It also depends on the base of the number being used (for example base = 10 for the decimal system or base = 2 for the binary system).

For example:<sup></sup>
153<sub>10</sub> is &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;an armstrong number in base 10, because: 153<sub>10</sub> = 1<sup>3</sup> + 5<sup>3</sup> + 3<sup>3</sup> = 1 + 125 + 27 = 154<sub>10</sub>
154<sub>10</sub> is *not* an armstrong number in base 10, because: 154<sub>10</sub> &ne; 1<sup>3</sup> + 5<sup>3</sup> + 4<sup>3</sup> = 1 + 125 + 64 = 190<sub>10</sub>
17<sub>10</sub> is &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;an armstrong number in base 3, because: 17<sub>10</sub> = 122<sub>3</sub> = 1<sup>3</sup> + 2<sup>3</sup> + 2<sup>3</sup> = 1 + 8 + 8 = 17<sub>10</sub>
18<sub>10</sub> is *not* an armstrong number in base 3, because: 18<sub>10</sub> = 200<sub>3</sub> &ne; 2<sup>3</sup> + 0<sup>3</sup> + 0<sup>3</sup> = 8 + 0 + 0 = 8<sub>10</sub>

Implement a function, that for a given number<sub>10</sub> and a base<sub>10</sub> returns True if the number is an armstrong number with respect to the numeral system "base" and False otherwise.
