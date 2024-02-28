extends Control

var save_path = "user://save/"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func start_save(slot: int):
	DirAccess.make_dir_absolute(save_path)
	
	var filepath = save_path + str("save", slot) + ".tres"
	if ResourceLoader.exists(filepath):
		print(filepath + " already exists.")
	else:
		var player = Player.new()
		player.name = "New"
		print("Saving to " + filepath)
		var result = ResourceSaver.save(player, filepath)
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_start_save_1_pressed():
	start_save(0)


func _on_start_save_2_pressed():
	start_save(1)
	pass # Replace with function body.


func _on_start_save_3_pressed():
	start_save(2)
	pass # Replace with function body.
