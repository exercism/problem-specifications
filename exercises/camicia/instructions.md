# Instructions

In this exercise, you will simulate a game very similar to the classic card game **Camicia**.
Your program will receive the initial configuration of two players' decks and must simulate the game until it ends (or detect that it will never end).

## Rules

- The deck is split between **two players**.
  Each player's cards are represented as a string where the leftmost character is the top of the deck.
- A round consists of both players taking a turn.
- Players take a turn by placing the **top card** of their deck onto a central pile.
- If the card is a **number card** (2-10), play simply passes to the other player.
- If the card is a **payment card**, a penalty must be paid:
  - `J` → opponent must pay 1 card
  - `Q` → opponent must pay 2 cards
  - `K` → opponent must pay 3 cards
  - `A` → opponent must pay 4 cards
- If the player paying a penalty reveals another payment card, that player stops paying the penalty.
  The other player must then pay a penalty based on the new payment card.
- If the penalty is fully paid without interruption, the player who laid the **last payment card** collects the central pile and places it at the bottom of their deck.
  That player then starts the next round.
- The moment when the winner of the round collects the cards from the central pile is called a **trick**.
- A **trick** can occur in two ways:
  - When a player finishes paying their penalty.
  - When a player runs out of cards, either at the start of their turn or while paying a penalty.
- The game **ends** when one player can no longer play a card.
  This can occur at the start of a turn or while paying a penalty.
- The game **enters a loop** as soon as decks identical to previous ones are played during the game, **not** counting number cards!

## Examples

A small example of a match that ends.

```text
Player A: "2A78Q10"
Player B: "3456K9J"
Pile: 2 → 3 → A → 4 → 5 → 6 → K → 7 → 8 → Q → 9 → J → 10
(status: "finished", cards: 13, tricks: 1)
```

This is a small example of a match that loops.

```text
Player A: "J23"
Player B: "4J5"
Pile: J → 4
(cards: 2, tricks: 1)

Player A: "23J4"
Player B: "J5"
Pile: 2 → J → 3
(cards: 5, tricks: 2)

Player A: "J4"
Player B: "52J3"
Pile: 5 → J → 2
(cards: 8, tricks: 3)

Player A: "45J2"
Player B: "J3"
Payment card configuration already viewed!
(status: "loop", cards: 8, tricks: 3)
```

## Your Task

- Parse the two players' decks from the input.
- Simulate the game following the rules above.
- Determine the following information regarding the game:
  - `status`: `"finished"` or `"loop"`
  - `cards`: total number of cards played throughout the game
  - `tricks`: number of times the central pile was collected

~~~~exercism/advanced
For those who want to take on a more exciting challenge, the hunt for other records for the longest game with an end is still open.
There are 653,534,134,886,878,245,000 (approximately 654 quintillion) possibilities, and we haven't calculated them all yet!
~~~~
