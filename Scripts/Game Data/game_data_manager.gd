extends Node2D
class_name GameDataManager

var sdc = SaveDataController.new()

@export var player:Player
@export var save_slot:int

func _init():
	player = Player.new()
	player.name = ""

func add_inventory_item(item: Item):
	player.inventory.append(item)
	print("Added item " + item.name + " to inventory.")
	return

func save_data():
	sdc.save_file(save_slot, player)
	return
