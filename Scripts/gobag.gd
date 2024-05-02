extends AnimatedSprite2D

@onready var gameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	if !gameData.has_inventory_item("Bag"):
		self.queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
