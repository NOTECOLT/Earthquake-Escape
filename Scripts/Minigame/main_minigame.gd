extends Node

class_name main_minigame

@onready var gameData = get_node("/root/GameData")

static var game_over: bool = false

#preload obstacles
var obs_plant = preload("res://Scenes/Minigame/obs_plant.tscn")
var obs_pipes = preload("res://Scenes/Minigame/obs_pipes.tscn")
var obs_rubbles = preload("res://Scenes/Minigame/obs_rubble.tscn")
var obs_wires = preload("res://Scenes/Minigame/obs_wires.tscn")
var obs_wood = preload("res://Scenes/Minigame/obs_wood.tscn")
var obs_trashG = preload("res://Scenes/Minigame/obs_trash_g.tscn")
var obs_trashY = preload("res://Scenes/Minigame/obs_trash_y.tscn")
var down_obs := [obs_trashY, obs_trashG, obs_plant, obs_rubbles]
var up_obs := [obs_pipes, obs_wires, obs_wood]
var obstacles : Array

#game variables
const DINO_START_POS := Vector2i(120, 500)
const CAM_START_POS := Vector2i(0, 0)
var difficulty
const MAX_DIFFICULTY : int = 2
var score : int
const SCORE_MODIFIER : int = 10
var high_score : int
var speed : float
const START_SPEED : float = 10.0
const MAX_SPEED : int = 25
const SPEED_MODIFIER : int = 5000
var screen_size : Vector2i
var ground_height : int
var game_running : bool
var last_obs

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	#print(screen_size, ground_height)
	ground_height = $Floor.get_node("Sprite2D").texture.get_height()
	#$GameOver.get_node("Button").pressed.connect(new_game)
	new_game()

func new_game():
	game_over = false
	#reset variables
	score = 0
	#show_score()
	game_running = false
	get_tree().paused = false
	difficulty = 0
	
	#delete all obstacles
	for obs in obstacles:
		obs.queue_free()
	obstacles.clear()
	
	#reset the nodes
	$Dino.position = DINO_START_POS
	$Dino.velocity = Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
	$Floor.position = Vector2i(0, 500)
	
	#reset hud and game over screen
	#$HUD.get_node("StartLabel").show()
	#$GameOver.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameData.game_paused: return
	if game_running:
		#speed up and adjust difficulty
		speed = START_SPEED

		
		#generate obstacles
		generate_obs()
		
		#move dino and camera
		$Dino.position.x += speed
		$Camera2D.position.x += speed
		
		
		#update ground position
		if $Camera2D.position.x - $Floor.position.x > screen_size.x * 1.5:
			$Floor.position.x += screen_size.x
			
		#remove obstacles that have gone off screen
		for obs in obstacles:
			if obs.position.x < ($Camera2D.position.x - screen_size.x):
				remove_obs(obs)
	else:
		if Input.is_action_pressed("ui_accept"):
			game_running = true

func generate_obs():
	#print(obstacles.is_empty(), last_obs)
	if obstacles.is_empty() or last_obs.position.x < randi_range(100, 500):
		var is_up = randi_range(0, 1)
		var obs_type
		if is_up:
			obs_type = up_obs[randi() % up_obs.size()]
		else:
			obs_type = down_obs[randi() % down_obs.size()]
		var obs
		var max_obs = 1
		for i in range(randi() % max_obs + 1):
			obs = obs_type.instantiate()
			var obs_height = obs.get_node("Sprite2D").texture.get_height()
			var obs_scale = obs.get_node("Sprite2D").scale
			var obs_x : int = $Dino.position.x + screen_size.x + 100 + (i * 100)
			var obs_y : int
			if is_up:
				obs_y = (obs_height * obs_scale.y / 2) + 5
			else:
				obs_y = screen_size.y - (obs_height * obs_scale.y / 2) + 5
			last_obs = obs
			#print(obs_x, obs_y)
			add_obs(obs, obs_x, obs_y)


func add_obs(obs, x, y):
	obs.position = Vector2i(x, y)
	obs.body_entered.connect(hit_obs)
	add_child(obs)
	obstacles.append(obs)

func remove_obs(obs):
	obs.queue_free()
	obstacles.erase(obs)
	
func hit_obs(body):
	if body.name == "Dino":
		print("game over")
		invoke_hit()
		#get_tree().paused = true
		#game_over()

# for the test case
static func invoke_hit():
	game_over = true

#func game_over():
	#check_high_score()
	#get_tree().paused = true
	#game_running = false
	#$GameOver.show()
