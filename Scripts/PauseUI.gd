extends Control
@onready var gameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pause_save_but_pressed():
	gameData.save_data()
	pass # Replace with function body.


func _on_pause_cont_but_pressed():
	gameData.pause_game = false
	visible = false


func _on_pause_exit_but_pressed():
	gameData.pause_game = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_pause_button_pressed():
	gameData.pause_game = true
	visible = true
