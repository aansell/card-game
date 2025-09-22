extends Node
class_name GameManager

signal card_played(card: Card, player: String)
signal game_state_changed(new_state: String)

enum GameState { MENU, DEALING, PLAYER_TURN, AI_TURN, GAME_OVER }

var current_state: GameState = GameState.MENU
var deck: Array[String] = []
var player_hand: Array[Card] = []
var ai_hand: Array[Card] = []
var discard_pile: Array[String] = []

@onready var player_hand_container = get_node("UI/PlayerHand")
@onready var ai_hand_container = get_node("UI/AIHand")
@onready var play_area = get_node("UI/PlayArea")

func _ready():
	initialize_deck()

func initialize_deck():
	deck = ["blank", "goblin", "ace_hearts"]
	print("Deck initialized with ", deck.size(), " card types")

func shuffle_deck():
	print("TODO: Implement shuffle_deck() function")
	deck.shuffle()

func deal_cards(num_cards: int = 5):
	print("TODO: Implement deal_cards() function")
	print("Dealing ", num_cards, " cards to each player")
	
	for i in range(num_cards):
		if deck.size() > 0:
			var card_id = deck.pop_front()
			var player_card = create_card(card_id)
			player_hand.append(player_card)
			
		if deck.size() > 0:
			var card_id = deck.pop_front()
			var ai_card = create_card(card_id)
			ai_hand.append(ai_card)

func draw_card(player: String) -> Card:
	print("TODO: Implement draw_card() function for player: ", player)
	
	if deck.size() == 0:
		print("Deck is empty, cannot draw card")
		return null
	
	var card_id = deck.pop_front()
	var card = create_card(card_id)
	
	if player == "player":
		player_hand.append(card)
		if player_hand_container:
			player_hand_container.add_child(card)
	elif player == "ai":
		ai_hand.append(card)
		if ai_hand_container:
			ai_hand_container.add_child(card)
	
	return card

func play_card(card: Card, player: String):
	print("TODO: Implement play_card() function")
	print("Player ", player, " played: ", card.get_card_name())
	
	if player == "player":
		var index = player_hand.find(card)
		if index >= 0:
			player_hand.remove_at(index)
			card.get_parent().remove_child(card)
			play_area.add_child(card)
	elif player == "ai":
		var index = ai_hand.find(card)
		if index >= 0:
			ai_hand.remove_at(index)
			card.get_parent().remove_child(card)
			play_area.add_child(card)
	
	card_played.emit(card, player)

func ai_play_turn():
	print("TODO: Implement ai_play_turn() function")
	
	if ai_hand.size() == 0:
		print("AI has no cards to play")
		return
	
	var random_index = randi() % ai_hand.size()
	var card_to_play = ai_hand[random_index]
	
	if card_to_play.can_be_played():
		play_card(card_to_play, "ai")
		print("AI played: ", card_to_play.get_card_name())
	else:
		print("AI tried to play an unplayable card")

func check_win_condition() -> String:
	print("TODO: Implement check_win_condition() function")
	
	if player_hand.size() == 0:
		return "player"
	elif ai_hand.size() == 0:
		return "ai"
	else:
		return ""

func reset_game():
	print("TODO: Implement reset_game() function")
	
	for card in player_hand:
		card.queue_free()
	player_hand.clear()
	
	for card in ai_hand:
		card.queue_free()
	ai_hand.clear()
	
	deck.clear()
	discard_pile.clear()
	
	initialize_deck()
	current_state = GameState.MENU

func create_card(card_id: String) -> Card:
	var card_scene = preload("res://Card.tscn")
	var card = card_scene.instantiate()
	card.card_id = card_id
	return card

func start_game():
	print("Starting new game")
	current_state = GameState.DEALING
	shuffle_deck()
	deal_cards(3)
	current_state = GameState.PLAYER_TURN
	game_state_changed.emit("player_turn")

func get_player_hand_size() -> int:
	return player_hand.size()

func get_ai_hand_size() -> int:
	return ai_hand.size()

func get_deck_size() -> int:
	return deck.size()