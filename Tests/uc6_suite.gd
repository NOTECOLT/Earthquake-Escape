extends "res://addons/gut/test.gd"

# UC6-S1
# Player clicks on a collectable item
# > Item gets added to inventory. Item disappears from main scene.
func test_uc6_s1():
	var gd: GameDataManager = GameDataManager.new()
	var interactable: Interactable = Interactable.new()
	interactable.interact = Interactable.ItemType.COLLECTABLE
	interactable.item = load("res://Resources/Items/bag.tres")
	
	interactable.item_interact(gd)
	
	assert_eq(gd.player.inventory[0], interactable.item, "Interacting with an item should add it to the inventory")
	gd.free()
	interactable.free()

# UC6-S2
# Player clicks on Map
# > Player opens up the map menu.
func test_uc6_s2():
	var gameData: GameDataManager = GameDataManager.new()
	var interactable: Interactable = Interactable.new()
	interactable.item = load("res://Resources/Items/notebook.tres")
	interactable.interact = Interactable.ItemType.UI
	
	interactable.item_interact(gameData)
	
	assert_eq(gameData.player.inventory, [], "Interacting with an item should add it to the inventory")
	gameData.free()
	interactable.free()

# UC6-S3
# Player clicks on interactable object
# > Dialogue Box or special action ensues for player.
func test_uc6_s3():
	var gameData: GameDataManager = GameDataManager.new()
	var interactable: Interactable = Interactable.new()
	interactable.item = load("res://Resources/Items/notebook.tres")
	interactable.interact = Interactable.ItemType.NONE
	
	interactable.item_interact(gameData)
	
	assert_eq(gameData.player.inventory, [], "Interacting with an item should add it to the inventory")
	gameData.free()
	interactable.free()
