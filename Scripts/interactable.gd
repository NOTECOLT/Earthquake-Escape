extends AnimatedSprite2D
var collected = false
var highlighted = false

@export var item: Item
@onready var gameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if collected:
		self.queue_free()
	else:
		if highlighted:
			self.play("Highlight")
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				collected = true
				if (item != null):
					print("Player clicked on " + item.name + ".")
					gameData.add_inventory_item(item)
				else:
					print("Player clicked on null item.")
		else:
			self.play("noHighlight")



func _on_area_2d_mouse_shape_entered(_shape_idx):
	highlighted = true


func _on_area_2d_mouse_shape_exited(shape_idx):
	highlighted = false

