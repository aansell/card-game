extends Control
class_name Card

@onready var card_name_label = $CardFrame/VBox/NameLabel
@onready var card_image = $CardFrame/VBox/CardImage
@onready var cost_label = $CardFrame/VBox/HBox/CostLabel
@onready var attack_label = $CardFrame/VBox/HBox/AttackLabel
@onready var health_label = $CardFrame/VBox/HBox/HealthLabel
@onready var description_label = $CardFrame/VBox/DescriptionLabel

var card_data: Dictionary = {}
var card_id: String = ""

func _ready():
	if card_id != "":
		load_card_data(card_id)

func load_card_data(id: String):
	card_id = id
	var file = FileAccess.open("res://card_data.json", FileAccess.READ)
	if file == null:
		print("Could not open card_data.json")
		return
	
	var json_string = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		print("Error parsing JSON: ", json.error_string)
		return
	
	var data = json.data
	if data.has("cards") and data.cards.has(id):
		card_data = data.cards[id]
		update_card_display()
	else:
		print("Card ID not found: ", id)

func update_card_display():
	if card_name_label:
		card_name_label.text = card_data.get("name", "Unknown")
	
	if cost_label:
		cost_label.text = "Cost: " + str(card_data.get("cost", 0))
	
	if attack_label and card_data.get("attack", 0) > 0:
		attack_label.text = "ATK: " + str(card_data.get("attack", 0))
		attack_label.visible = true
	elif attack_label:
		attack_label.visible = false
	
	if health_label and card_data.get("health", 0) > 0:
		health_label.text = "HP: " + str(card_data.get("health", 0))
		health_label.visible = true
	elif health_label:
		health_label.visible = false
	
	if description_label:
		description_label.text = card_data.get("description", "")

func get_card_name() -> String:
	return card_data.get("name", "")

func get_card_type() -> String:
	return card_data.get("type", "")

func get_rank() -> int:
	return card_data.get("rank", 0)

func get_value() -> int:
	return card_data.get("value", 0)

func get_suit() -> String:
	return card_data.get("suit", "")

func get_cost() -> int:
	return card_data.get("cost", 0)

func get_attack() -> int:
	return card_data.get("attack", 0)

func get_health() -> int:
	return card_data.get("health", 0)

func get_description() -> String:
	return card_data.get("description", "")

func is_blank() -> bool:
	return card_data.get("type", "") == "blank"

func can_be_played() -> bool:
	return not is_blank()

func _on_card_clicked():
	print("Card clicked: ", get_card_name())