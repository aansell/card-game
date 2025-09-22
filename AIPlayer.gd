extends Node
class_name AIPlayer

enum AIStrategy { RANDOM, AGGRESSIVE, DEFENSIVE, SMART }

var current_strategy: AIStrategy = AIStrategy.RANDOM
var game_manager: GameManager

func _init(manager: GameManager):
	game_manager = manager

func choose_card_to_play(hand: Array[Card]) -> Card:
	print("TODO: Implement AI card selection logic")
	
	var playable_cards = []
	for card in hand:
		if card.can_be_played():
			playable_cards.append(card)
	
	if playable_cards.size() == 0:
		return null
	
	match current_strategy:
		AIStrategy.RANDOM:
			return choose_random_card(playable_cards)
		AIStrategy.AGGRESSIVE:
			return choose_aggressive_card(playable_cards)
		AIStrategy.DEFENSIVE:
			return choose_defensive_card(playable_cards)
		AIStrategy.SMART:
			return choose_smart_card(playable_cards)
		_:
			return choose_random_card(playable_cards)

func choose_random_card(cards: Array[Card]) -> Card:
	print("TODO: Implement random card selection")
	if cards.size() == 0:
		return null
	return cards[randi() % cards.size()]

func choose_aggressive_card(cards: Array[Card]) -> Card:
	print("TODO: Implement aggressive card selection (highest attack/cost)")
	
	var best_card = null
	var highest_attack = -1
	
	for card in cards:
		var attack = card.get_attack()
		if attack > highest_attack:
			highest_attack = attack
			best_card = card
	
	if best_card == null and cards.size() > 0:
		best_card = cards[0]
	
	return best_card

func choose_defensive_card(cards: Array[Card]) -> Card:
	print("TODO: Implement defensive card selection (highest health/lowest cost)")
	
	var best_card = null
	var lowest_cost = 999
	
	for card in cards:
		var cost = card.get_cost()
		if cost < lowest_cost:
			lowest_cost = cost
			best_card = card
	
	if best_card == null and cards.size() > 0:
		best_card = cards[0]
	
	return best_card

func choose_smart_card(cards: Array[Card]) -> Card:
	print("TODO: Implement smart AI that considers game state")
	
	var player_hand_size = game_manager.get_player_hand_size()
	var ai_hand_size = game_manager.get_ai_hand_size()
	
	if ai_hand_size > player_hand_size:
		return choose_aggressive_card(cards)
	else:
		return choose_defensive_card(cards)

func should_draw_card() -> bool:
	print("TODO: Implement AI decision for drawing cards")
	
	var ai_hand_size = game_manager.get_ai_hand_size()
	var deck_size = game_manager.get_deck_size()
	
	if ai_hand_size < 3 and deck_size > 0:
		return true
	
	return false

func evaluate_game_state() -> Dictionary:
	print("TODO: Implement game state evaluation")
	
	return {
		"player_threat_level": 0,
		"ai_advantage": 0,
		"recommended_action": "play_card"
	}

func set_strategy(new_strategy: AIStrategy):
	current_strategy = new_strategy
	print("AI strategy changed to: ", AIStrategy.keys()[new_strategy])