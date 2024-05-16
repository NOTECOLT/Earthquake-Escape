extends Node2D
class_name GameDataManager

var sdc = SaveDataController.new()

@export var player:Player
@export var save_slot:int

@export var disable_interactions:bool = false
@export var game_paused:bool = false
@export var game_over:bool = false
@export var level_end: bool = false

@export var current_minigame_level: int = -1

func _init():
	player = Player.new()
	
func clear_data():
	player = Player.new()

func add_inventory_item(item: Item):
	player.inventory.append(item)
	print("Added item " + item.name + " to inventory.")
	return
	
func has_inventory_item(item_name: String):
	for i in player.inventory:
		if i.name == item_name:
			return true
	return false

func tick_flag(flag_name: String):
	if (!player.flags.has(flag_name)):
		print(flag_name + " does not exist!")
		return false
		
	if (player.flags[flag_name]):
		print(flag_name + " is already ticked!")
		return false
		
	player.flags[flag_name] = true
	return true

func save_data():
	sdc.save_file(save_slot, player)
	return

func pause_game():
	game_paused = true

func unpause_game():
	game_paused = false

func get_hit():
	game_over = true

func reach_level_end():
	level_end = true
