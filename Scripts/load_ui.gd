extends Control

var sdc = SaveDataController.new()
@onready var gameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_load_save_1_pressed():
	var player = sdc.load_save(0)
	if (player == null): return
	else:
		load_game(player)

func _on_load_save_2_pressed():
	var player = sdc.load_save(1)
	if (player == null): return
	else:
		load_game(player)

func _on_load_save_3_pressed():
	var player = sdc.load_save(2)
	if (player == null): return
	else:
		load_game(player)
		
func load_game(player: Player):
	gameData.player = player
	get_tree().change_scene_to_file("res://Scenes/living_room.tscn")
