extends Resource

class_name Player

@export var name: String = ""
@export var inventory: Array[Item] = []
@export var current_scene: String = ""
@export var flags = {
	"living_room_entered": false,
	"bedroom_entered": false,
	"open_piggy_bank": false,
	"hallway_entered": false,
	"open_map": false,
	"open_locker": false,
}
