extends "res://addons/gut/test.gd"

# UC2-S1
# Player has no save files stored in any of the save slots
# > Error Prompt saying no save file is contained within selected Save Slot
func uc2_s1():
	var path = "user://save/save3.tres"
	if ResourceLoader.exists(path):
		DirAccess.remove_absolute(path)
		
	var sdc = SaveDataController.new()
	
	var result = sdc.load_save(3)
	assert_eq(result, null, "Loading an empty slot should produce an error")

# UC2-S2
# Player has at least one save file stored in any of the save slots
# > Game Is Loaded with the savefile in the selected Save Slot
func uc2_s2():
	var path = "user://save/save3.tres"
	if ResourceLoader.exists(path):
		DirAccess.remove_absolute(path)
	
	var sdc = SaveDataController.new()
	var player = sdc.start_save(3)
	
	var result = sdc.load_save(3)
	DirAccess.remove_absolute(path)
	assert_eq(result, player, "Loading an existing save should proceed as usual")
