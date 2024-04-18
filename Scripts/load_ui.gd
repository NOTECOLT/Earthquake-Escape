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
		load_game(player, 0)

func _on_load_save_2_pressed():
	var player = sdc.load_save(1)
	if (player == null): return
	else:
		load_game(player, 1)

func _on_load_save_3_pressed():
	var player = sdc.load_save(2)
	if (player == null): return
	else:
		load_game(player, 2)
		
func load_game(player: Player, slot: int):
	gameData.player = player
	gameData.save_slot = slot
	
	gameData.disable_interactions = false
	gameData.game_paused = false
	
	get_tree().change_scene_to_file(gameData.player.current_scene)
	#get_tree().change_scene_to_file("res://Scenes/GameScenes/hallway.tscn")
