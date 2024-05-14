extends Button


@export var slide: GlossarySlide

@export var title: Label
@export var source: Label
@export var body: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func load_slide():
	title.text = slide.title
	source.text = slide.source
	body.text = slide.body
