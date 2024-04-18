extends AnimatedSprite2D

class_name Interactable

enum ItemType { NONE, COLLECTABLE, UI, CHANGE_SCENE }

var highlighted = false

@export var item: Item
@export var bypassDisableInteraction: bool = false
@export var interact: ItemType = ItemType.NONE
@onready var gameData = get_node("/root/GameData")
@export var dialogue: DialogueResource
@export var popup: Node
@export var changeScene: String

# Called when the node enters the scene tree for the first time.
func _ready():
	if (item != null):
		for i in gameData.player.inventory:
			if item == i:
				self.queue_free()
				break
	highlighted = false
	self.play("noHighlight")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if gameData.pause_game: return
	
	if !gameData.disable_interactions or bypassDisableInteraction:
		if highlighted:
			self.play("Highlight")
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				item_interact(gameData)
		else:
			self.play("noHighlight")

func item_interact(gd: GameDataManager):
	if (dialogue != null):
		DialogueManager.show_dialogue_balloon(dialogue, "start")
	match (interact):
		ItemType.COLLECTABLE:
			if (item != null):
				print("Player clicked on " + item.name + ".")
				gd.add_inventory_item(item)
				#gd.save_data()
				self.queue_free()
			else:
				print("Player clicked on null item.")
		ItemType.UI:
			if (popup != null):
				gameData.disable_interactions = true
				popup.visible = !popup.visible
		ItemType.CHANGE_SCENE:
			gameData.player.current_scene = changeScene
			get_tree().change_scene_to_file(changeScene)
	return

func _on_area_2d_mouse_shape_entered(_shape_idx):
	highlighted = true

func _on_area_2d_mouse_shape_exited(_shape_idx):
	highlighted = false
