# Instructions

In this exercise, you will simulate the classic card game **Camicia**.
Your program will receive the initial configuration of two players’ decks and must simulate the game until it ends (or detect that it will never end).

## Rules

- The deck is split between **two players**.
  Each player's cards are represented as a string where the leftmost character is the top of the deck.
- Players take turns placing the **top card** of their deck onto a central pile.
- If the card is a **number card** (2-10), play simply passes to the other player.
- If the card is a **payment card**, a price needs to be paid:
  - `J` → opponent must pay 1 card
  - `Q` → opponent must pay 2 cards
  - `K` → opponent must pay 3 cards
  - `A` → opponent must pay 4 cards
- If the player paying a penalty reveals another payment card, that player stops paying the penalty and the other player much then pay the penalty.
- If the penalty is fully paid without interruption, the player who laid the **last payment card** collects the central pile and places it at the bottom of their deck.
  That player then starts the next round.
- The moment when the winner of the round collects the cards from the central pile is called a **trick**.
- A **trick** can occur in several ways:
  - When a player finishes paying their penalty → the game continues
  - When a player runs out of cards while paying a penalty → the game ends
  - When a player can no longer place a card in the central pile → the game ends
- The game **ends** when one player can no longer respond by playing a card, in general.
- The game **enters a loop** as soon as decks identical to previous ones are played during the game, ***not*** counting number cards!

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

### Explanation

- Player A only has number cards, so can never defend against a payment card.
- Player B has a long sequence of payment cards: Aces, Kings, Queens, and Jacks.
- Each payment card forces a payment, which Player A cannot counter with a payment card of their own, so Player B repeatedly wins the pile (repeatedly completes a trick).
- In the end, player B captures their opponent's entire deck by playing 40 cards in just 4 "tricks" (turns in which a deck is collected).

## Your Task

- Parse the two players' decks from the input.
- Simulate the game following the rules above.
- Determine is the final game status is `"finished"` or `"loop"`.
  - `"status"`: `"finished"` or `"loop"`
  - `"cards"`: total number of cards played throughout the game
  - `"tricks"`: number of times the central pile was collected
