class_name SaveDataController

var save_path = "user://save/"

func start_save(slot: int):
	DirAccess.make_dir_absolute(save_path)
	
	var filepath = save_path + str("save", slot) + ".tres"
	if ResourceLoader.exists(filepath):
		print(filepath + " already exists. Existing save must be overwritten.")
		return null
	else:
		var player = Player.new()
		player.name = "Player"
		print("Starting new save at " + filepath)
		ResourceSaver.save(player, filepath)
		return player

func load_save(slot: int):
	DirAccess.make_dir_absolute(save_path)
	
	var filepath = save_path + str("save", slot) + ".tres"
	if ResourceLoader.exists(filepath):
		var player = ResourceLoader.load(filepath)
		if player is Player:
			print("Loading " + filepath)
			print("Name: " + player.name)
			print("Game Loaded with save " + filepath)
			return player
	else:
		print("Cannot load file " + filepath + " because it does not exist.")
		return null
