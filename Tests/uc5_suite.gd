extends "res://addons/gut/test.gd"

# UC5-S1
# Player clicks “View Safety Information” on the main menu
# > Show safety information UI; all slides are accessible to the user.
func test_uc5_s1():
	var scene = load("res://Scenes/glossary_ui.tscn")
	var loaded_scene = scene.instantiate()
	
	assert_eq(loaded_scene.name, "GlossaryUI", "Title of node must be GlossaryUI")
	loaded_scene.free()

# UC5-S2
# Player reaches a bad ending
# > Show safety information UI; only the slides related to the bad ending are accessible to the user.
func test_uc5_s2():
	var scene = load("res://Scenes/Endings/dead_end.tscn")
	var loaded_scene = scene.instantiate()
	
	assert_eq(loaded_scene.name, "DeadEnd", "Title of node must be GlossaryUI")
	loaded_scene.free()
	
# UC5-S3
# Player reaches a good ending
# > Show safety information UI; all slides are accessible to the user.
func test_uc5_s3():
	var scene = load("res://Scenes/Endings/game_win.tscn")
	var loaded_scene = scene.instantiate()
	
	assert_eq(loaded_scene.name, "GameWin", "Title of node must be GameWin")
	loaded_scene.free()
