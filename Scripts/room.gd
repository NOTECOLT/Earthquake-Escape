extends Node2D

@onready var gameData = get_node("/root/GameData")
@export var flag_enter: String
@export var on_enter_dialogue: DialogueResource

var player_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	player_name = gameData.player.name
	if (gameData.tick_flag(flag_enter)):
		DialogueManager.show_dialogue_balloon(on_enter_dialogue, "start")
		pass
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
