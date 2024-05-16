extends "res://addons/gut/test.gd"

# UC7-S1
# Player hits an obstacle
# > Game Over
func test_uc7_s1():
	var gd: GameDataManager = GameDataManager.new()
	gd.get_hit()
	
	assert_eq(gd.game_over, true, "Hit must return true.")

# UC7-S2
# Player reaches the end of path
# > Level Endscreen should appear
func test_uc7_s2():
	assert_eq(true, false, "unimplemented")
