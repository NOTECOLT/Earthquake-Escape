extends Node2D
class_name GameDataManager

@export var player:Player

func _init():
	player = Player.new()
	player.name = ""

func add_inventory_item(item: Item):
	player.inventory.append(item)
	print("Added item " + item.name + " to inventory.")
	return
