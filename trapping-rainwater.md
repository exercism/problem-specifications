 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

### Example ###
Given [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1] as evaluation map:

                                +---+
                +---+           |   |---+   +---+
        +---+   |   |---+   +---|   |   |---|   |---+
        |   |   |   |   |   |   |   |   |   |   |   |
    -------------------------------------------------
    | 0 | 1 | 0 | 2 | 1 | 0 | 1 | 3 | 2 | 1 | 2 | 1 |
after the rain it was so:

                                +---+
                +---+$$$$$$$$$$$|   |---+$$$+---+
        +---+   |   |---+   +---|   |   |---|   |---+
        |   |$$$|   |   |$$$|   |   |   |   |   |   |
    -------------------------------------------------
    | 0 | 1 | 0 | 2 | 1 | 0 | 1 | 3 | 2 | 1 | 2 | 1 |

In this case, 6 units of rain water ("$" section) are being trapped and the program should return 6.
