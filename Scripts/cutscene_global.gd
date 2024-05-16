extends Node2D
class_name cutscene_global

@onready var gameData = get_node("/root/GameData")

func start_dialogue():
	gameData.disable_interactions = true
	
func end_dialogue():
	gameData.disable_interactions = false

func said_no():
	print("player said no")

func change_to_cutscene1():
	SceneTransition.change_scene_to_file('res://Scenes/cutscene1.tscn')
	
func change_to_cutscene2():
	SceneTransition.change_scene_to_file('res://Scenes/cutscene2.tscn')

func change_to_hallway():
	gameData.player.current_scene = 'res://Scenes/GameScenes/hallway.tscn'
	SceneTransition.change_scene_to_file('res://Scenes/GameScenes/hallway.tscn')

func change_to_minigame_level1():
	SceneTransition.change_scene_to_file('res://Scenes/Minigame/level1.tscn')

func change_to_minigame_level2():
	SceneTransition.change_scene_to_file('res://Scenes/Minigame/level2.tscn')
	
func change_to_minigame_level3():
	SceneTransition.change_scene_to_file('res://Scenes/Minigame/level3.tscn')
