extends Control

var sdc = SaveDataController.new()
@onready var gameData = get_node("/root/GameData")

@export var start_prompt: Control
@export var start_label: Label
@export var line_edit: LineEdit
var start_prompt_opened:bool = false

var opened_slot: int = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	start_prompt_opened = false
	start_prompt.visible = false
	opened_slot = -1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	SceneTransition.change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_start_save_1_pressed():
	if start_prompt_opened: return
	
	opened_slot = 0
	open_start_prompt()

func _on_start_save_2_pressed():
	if start_prompt_opened: return
	
	opened_slot = 1
	open_start_prompt()

func _on_start_save_3_pressed():
	if start_prompt_opened: return

	opened_slot = 2
	open_start_prompt()

# allows the player to enter their name
func open_start_prompt():
	if (sdc.save_exists(opened_slot)):
		start_label.text = "Save Slot " + str(opened_slot + 1) + " exists! Creating a new\nsave will overwrite existing data.\nEnter your name:"
	else:
		start_label.text = "Creating a new save at slot " + str(opened_slot + 1) +".\nEnter your name:"
	start_prompt_opened = true
	start_prompt.visible = true

func close_start_prompt():
	opened_slot = -1
	start_prompt_opened = false
	start_prompt.visible = false

func start_game():
	DirAccess.remove_absolute("user://save/" + str("save", opened_slot) + ".tres")
	var player = sdc.start_save(opened_slot)[0]

	# updates the name to that of the field
	if line_edit.text == "":
		player.name = "Player"
	else:
		player.name = line_edit.text
	sdc.save_file(opened_slot, player)
	
	gameData.player = player
	gameData.save_slot = opened_slot
	
	gameData.disable_interactions = false
	gameData.game_paused = false
	SceneTransition.change_scene_to_file(gameData.player.current_scene)

