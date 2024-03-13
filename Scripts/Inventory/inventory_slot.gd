extends TextureRect

@export var item:Item
@export var slot:int

@onready var gameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	if (slot < gameData.player.inventory.size()):
		if (gameData.player.inventory[slot] != null):
			item = gameData.player.inventory[slot]
			texture = item.texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (item == null and slot < gameData.player.inventory.size()):
		if (gameData.player.inventory[slot] != null):
			item = gameData.player.inventory[slot]
			texture = item.texture
