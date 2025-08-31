# Instructions

In this exercise, you will simulate the classic card game **Camicia**.
Your program will receive the initial configuration of two players’ decks and must simulate the game until it ends (or detect if it never does).

## Rules

* The deck is split between **two players**. Each player’s cards are represented as a string (top of the deck = leftmost character).

* Players take turns placing the **top card** of their deck onto a central pile.

* If the card is a **number card** (`-` in this scenario), play simply passes to the other player.

* If the card is a **payment card**:

  * `J` → opponent must pay 1 card
  * `Q` → opponent must pay 2 cards
  * `K` → opponent must pay 3 cards
  * `A` → opponent must pay 4 cards

* While paying, if the opponent reveals another payment card, the penalty immediately switches back.

* If the penalty is fully paid without interruption, the player who laid the **last payment card** collects the central pile and places it at the bottom of their deck. That player also starts the next round.

* The game ends when one player has no more cards.

## Example

Here’s a simple example of input and output.

```json
"input": {
  "playerA": "--------------------------",
  "playerB": "----------AAAAKKKKQQQQJJJJ"
},
"output": {
  "status": "finished",
  "cards": 40,
  "tricks": 4
}
```

### Explanation:

* Player A only has number cards (`-`), so can never defend against a payment card.
* Player B has a long sequence of Aces, Kings, Queens, and Jacks.
* Each court card forces penalties, which Player A cannot counterattack, so Player B repeatedly wins the pile.
* In the end, player B captures his opponent's entire deck by playing 40 cards in just 4 "tricks" (turns in which a deck is collected).

## Your Task

* Parse the two players’ decks from the input.
* Simulate the game following the rules above.
* Determine is the final game status is `"finished"` or `"loop"`.

   * `"status"`: `"finished"` or `"loop"`
   * `"cards"`: total number of cards played throughout the game
   * `"tricks"`: number of times the central pile was collected