extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_new_button_pressed():
	get_tree().change_scene_to_file("res://start_ui.tscn")


func _on_gloss_button_pressed():
	get_tree().change_scene_to_file("res://glossary_ui.tscn")


func _on_load_button_pressed():
	get_tree().change_scene_to_file("res://load_ui.tscn")