extends Control

var sdc = SaveDataController.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_load_save_1_pressed():
	sdc.load_save(0)


func _on_load_save_2_pressed():
	sdc.load_save(1)


func _on_load_save_3_pressed():
	sdc.load_save(2)
