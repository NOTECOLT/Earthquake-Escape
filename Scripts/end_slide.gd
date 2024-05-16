extends Node

@export var slide: GlossarySlide

@export var slide_ui: Panel
@export var title: Label
@export var source: Label
@export var body: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	title.text = slide.title
	source.text = slide.source
	body.text = slide.body


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_slide():
	slide_ui.visible = !slide_ui.visible

func open_main_menu():
	SceneTransition.change_scene_to_file('res://Scenes/main_menu.tscn')
