extends "res://addons/gut/test.gd"

# UC4-S1
# Player saves during a point & click gameplay
# > The state of the scenario is saved.
func test_uc4_s1():
	var path = "user://save/save3.tres"
	var scene_path = "res://Scenes/GameScenes/living_room.tscn"
	if ResourceLoader.exists(path):
		DirAccess.remove_absolute(path)
	
	var sdc = SaveDataController.new()
	var player = Player.new()
	player.name = "Player"
	player.current_scene = scene_path
	
	var result = sdc.save_file(3, player)
	player = Player.new()
	player = sdc.load_save(3)
	
	assert_eq(player.current_scene, scene_path)
	DirAccess.remove_absolute(path)
