extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_main_menu():
	SceneTransition.change_scene_to_file('res://Scenes/main_menu.tscn')
