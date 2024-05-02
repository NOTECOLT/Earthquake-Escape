extends Node2D
class_name cutscene_global

@onready var gameData = get_node("/root/GameData")

func change_to_cutscene1():
	get_tree().change_scene_to_file('res://Scenes/cutscene1.tscn')

func change_to_hallway():
	gameData.player.current_scene = 'res://Scenes/GameScenes/hallway.tscn'
	get_tree().change_scene_to_file('res://Scenes/GameScenes/hallway.tscn')
