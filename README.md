# Card Game Starter Project

This is a starter project for a card game jam using Godot. Students will implement various card game mechanics and create their own card games.

## Project Structure

- `Card.gd` - The main card script that handles loading card data and displaying cards
- `Card.tscn` - The card scene with UI elements
- `GameManager.gd` - Manages game state, deck, hands, and game flow
- `card_data.json` - Contains card definitions and properties
- `assets/cards/` - Directory for card images

## Example Cards Included

1. **Blank Card** - A template card that can be customized
2. **Goblin Warrior** - A creature card with attack and health
3. **Ace of Hearts** - A traditional playing card

## Key Functions to Implement (Currently Stubs)

### GameManager Functions:
- `shuffle_deck()` - Randomize the deck order
- `deal_cards(num_cards)` - Deal cards to players at game start
- `draw_card(player)` - Draw a card from deck to player's hand
- `play_card(card, player)` - Play a card from hand to play area
- `ai_play_turn()` - AI logic for playing cards
- `check_win_condition()` - Determine if game is over and who won
- `reset_game()` - Reset game state for new game

### Card Properties Available:
- `name` - Display name of the card
- `type` - Card type (blank, creature, traditional, etc.)
- `rank` - Numerical rank (useful for traditional cards)
- `value` - Point value or alternate ranking
- `suit` - Suit for traditional cards (hearts, spades, etc.)
- `cost` - Resource cost to play the card
- `attack` - Attack power for creature cards
- `health` - Health points for creature cards
- `description` - Flavor text or rules text

## Getting Started

1. Open the project in Godot
2. Run the project to see the basic structure
3. Examine the existing cards in `card_data.json`
4. Implement the stub functions in `GameManager.gd`
5. Create new card types by adding entries to `card_data.json`
6. Add card images to `assets/cards/` folder

## Game Types You Can Create

- **Traditional Card Games**: Hearts, Blackjack, Go Fish, War
- **Trading Card Games**: Magic-style games, Pokemon-style games
- **Custom Card Games**: Invent your own rules and mechanics

## Next Steps for Students

1. Implement basic deck shuffling and dealing
2. Create player vs AI gameplay
3. Add win conditions specific to your game type
4. Design and add new cards
5. Implement special card effects
6. Add animations and polish