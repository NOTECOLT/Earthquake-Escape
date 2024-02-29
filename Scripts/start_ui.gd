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

func _on_start_save_1_pressed():
	sdc.start_save(0)


func _on_start_save_2_pressed():
	sdc.start_save(1)
	pass # Replace with function body.


func _on_start_save_3_pressed():
	sdc.start_save(2)
	pass # Replace with function body.
