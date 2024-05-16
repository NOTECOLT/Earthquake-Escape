extends Control

@export var start_slide: GlossarySlide

@export var title: Label
@export var source: Label
@export var body: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	title.text = start_slide.title
	source.text = start_slide.source
	body.text = start_slide.body
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	SceneTransition.change_scene_to_file("res://Scenes/main_menu.tscn")
