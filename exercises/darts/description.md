# Description

Calculate the points scored in a single toss of a Darts game.

[Darts][darts] is a game where players throw darts at a [target][darts-target].

In our particular instance of the game, the target rewards 4 different amounts of points, depending on where the dart lands:

![Our dart scoreboard with values from a complete miss to a bullseye](https://assets.exercism.org/images/exercises/darts/darts-scoreboard.svg)

- If the dart lands outside the target, player earns no points (0 points).
- If the dart lands in the outer circle of the target, player earns 1 point.
- If the dart lands in the middle circle of the target, player earns 5 points.
- If the dart lands in the inner circle of the target, player earns 10 points.

The outer circle has a radius of 10 units (this is equivalent to the total radius for the entire target), the middle circle a radius of 5 units, and the inner circle a radius of 1.
Of course, they are all centered at the same point — that is, the circles are [concentric][] defined by the coordinates (0, 0).

Given a point in the target (defined by its [Cartesian coordinates][cartesian-coordinates] `x` and `y`, where `x` and `y` are [real][real-numbers]), calculate the correct score earned by a dart landing at that point.

~~~~exercism/note
To find which circle a dart falls in, you can compute the [distance][distance-formula] from the point to the center (0, 0) and compare it against each circle's radius.
~~~~

## Credit

The scoreboard image was created by [habere-et-dispertire][habere-et-dispertire] using [Inkscape][inkscape].

[darts]: https://en.wikipedia.org/wiki/Darts
[darts-target]: https://en.wikipedia.org/wiki/Darts#/media/File:Darts_in_a_dartboard.jpg
[concentric]: https://en.wikipedia.org/wiki/Concentric_objects
[distance-formula]: https://www.mathsisfun.com/algebra/distance-2-points.html
[cartesian-coordinates]: https://www.mathsisfun.com/data/cartesian-coordinates.html
[real-numbers]: https://www.mathsisfun.com/numbers/real-numbers.html
[habere-et-dispertire]: https://exercism.org/profiles/habere-et-dispertire
[inkscape]: https://en.wikipedia.org/wiki/Inkscape
