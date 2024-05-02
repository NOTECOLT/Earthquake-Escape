extends Control

var sdc = SaveDataController.new()
@onready var gameData = get_node("/root/GameData")

@export var error_label: Label
@export var error_prompt: Control
var error_prompt_opened:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	error_prompt_opened = false
	error_prompt.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_load_save_1_pressed():
	if error_prompt_opened: return
	var player = sdc.load_save(0)
	if (player == null):
		open_error_prompt(0)
	else:
		load_game(player, 0)

func _on_load_save_2_pressed():
	if error_prompt_opened: return
	var player = sdc.load_save(1)
	if (player == null): 
		open_error_prompt(1)
	else:
		load_game(player, 1)

func _on_load_save_3_pressed():
	if error_prompt_opened: return
	var player = sdc.load_save(2)
	if (player == null): 
		open_error_prompt(2)
	else:
		load_game(player, 2)

# allows the player to enter their name
func open_error_prompt(opened_slot: int):
	error_label.text = "Save Slot " + str(opened_slot + 1) +" does not exist!\nPlease write a new save to play."
	error_prompt_opened = true
	error_prompt.visible = true

func close_error_prompt():
	error_prompt_opened = false
	error_prompt.visible = false
	
func load_game(player: Player, slot: int):
	gameData.player = player
	gameData.save_slot = slot
	
	gameData.disable_interactions = false
	gameData.game_paused = false
	
	get_tree().change_scene_to_file(gameData.player.current_scene)
