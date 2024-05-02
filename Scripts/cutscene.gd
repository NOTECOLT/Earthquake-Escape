extends Node2D

@onready var gameData = get_node("/root/GameData")
@export var dialogue: DialogueResource

var player_name = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	player_name = gameData.player.name
	DialogueManager.show_dialogue_balloon(dialogue, "start")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
