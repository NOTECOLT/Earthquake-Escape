extends "res://addons/gut/test.gd"

# UC1-S1
# Player starts the game when there are still available save slots
# > New Game is started with save file occupying Selected Save Slot
func test_uc1_s1():
	var path = "user://save/save3.tres"
	if ResourceLoader.exists(path):
		DirAccess.remove_absolute(path)
		
	var sdc = SaveDataController.new()
	var player = Player.new()
	player.name = "Player"
	
	var result = sdc.start_save(3)[0]
	DirAccess.remove_absolute(path)
	assert_eq(result.name, player.name, "Starting a new game on an empty slot should proceed as normal")
	assert_eq_deep(result.inventory, player.inventory)

# UC1-S2
# Player starts the game when all three save slots are full
# > Prompt shows up asking the player to overwrite the selected Save Slot
func test_uc1_s2():
	var path = "user://save/save3.tres"
	if ResourceLoader.exists(path):
		DirAccess.remove_absolute(path)
	
	var sdc = SaveDataController.new()
	sdc.start_save(3)
	
	var result = sdc.start_save(3)[1]
	DirAccess.remove_absolute(path)
	assert_eq(result, true, "Starting a new game on an existing slot should result in an overwrite prompt")
