extends Control

var save_path = "user://save/"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func load_save(slot: int):
	DirAccess.make_dir_absolute(save_path)
	
	var filepath = save_path + str("save", slot) + ".tres"
	if ResourceLoader.exists(filepath):
		var player = ResourceLoader.load(filepath)
		if player is Player:
			print("Loading " + filepath)
			print("Name: " + player.name)
			return player
	else:
		print("Cannot load file " + filepath + " because it does not exist.")
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_load_save_1_pressed():
	load_save(0)


func _on_load_save_2_pressed():
	load_save(1)
	pass # Replace with function body.


func _on_load_save_3_pressed():
	load_save(2)
	pass # Replace with function body.
