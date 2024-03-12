extends Node2D
class_name GameDataManager

@export var player:Player

func _init():
	player = Player.new()
	player.name = ""
