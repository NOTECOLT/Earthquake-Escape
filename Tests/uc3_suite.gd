extends "res://addons/gut/test.gd"

# UC3-S1
# Player pauses while playing the game
# > Game progression is paused and Pause UI is displayed
func test_uc3_s1():
	var gameData: GameDataManager = GameDataManager.new()
	
	gameData.pause_game()
	
	assert_eq(gameData.game_paused, true)
	gameData.free()
