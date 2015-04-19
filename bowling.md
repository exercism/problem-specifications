Bowling is game where players roll a heavy ball to knock down pins
arranged in a triangle. Write code to keep track of the score
of a game of bowling.

## Scoring Bowling

The game consists of 10 frames. In each frame the player has two
opportunities to knock down 10 pins.  The score for the frame is the
total number of pins knocked down, plus bonuses for strikes and spares.

A spare is when the player knocks down all 10 pins in two tries.  The
bonus for that frame is the number of pins knocked down by the next
roll. For example a player rolls in the first three frames respectively
4+2, 3+7 and 5+1. For frame 2, the score is 10 (the total number knocked
down) plus a bonus of 5 (the number of pins knocked down on the next roll.)

A strike is when the player knocks down all 10 pins on his first try.
The bonus for that frame is the value of the next two balls rolled
(the value of the next frame, not counting the bonus).

In the tenth frame a player who rolls a spare or strike is allowed to
roll the extra balls to complete the frame.  However no more than three
balls can be rolled in tenth frame.

## Requirements

Write code to keep track of the score of a game of bowling. It should
support two operations:

* `roll(pins : int)` is called each time the player rolls a ball.  The
  argument is the number of pins knocked down.
* `score() : int` is called only at the very end of the game.  It
  returns the total score for that game.
