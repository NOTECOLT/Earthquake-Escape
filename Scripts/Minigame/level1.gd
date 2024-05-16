extends Node

@onready var gameData = get_node("/root/GameData")

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
var speed : float
const START_SPEED : float = 10.0
var screen_size : Vector2i
var ground_height : int
var game_running : bool
var last_obs

@export var level_end_dialogue: DialogueResource
@export var die_dialogue: DialogueResource
var player_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	gameData.current_minigame_level = 1
	player_name = gameData.player.name
	screen_size = get_window().size
	#print(screen_size, ground_height)
	ground_height = $Floor.get_node("Sprite2D").texture.get_height()
	#$GameOver.get_node("Button").pressed.connect(new_game)
	new_game()

func new_game():
	gameData.game_over = false

	game_running = true
	get_tree().paused = false
	
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

func finish_run():
	print("arrived at end")
	game_running = false
	DialogueManager.show_dialogue_balloon(level_end_dialogue, "start")
	#get_tree().paused = true
	

func Game_over():
	print("game over")
	gameData.get_hit()
	var hit_dialogue = load('res://Dialogue/Minigame/hit.dialogue')
	DialogueManager.show_dialogue_balloon(hit_dialogue, "start")
	#get_tree().paused = true
	game_running = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameData.game_paused: return
	if game_running:
		#speed up and adjust difficulty
		speed = START_SPEED
		
		var end_goal = 7000

		
		#generate obstacles
		generate_obs()
		
		#move dino and camera
		$Dino.position.x += speed
		$Camera2D.position.x += speed
		
		if $Dino.position.x == end_goal:
			print($Dino.position.x)
			finish_run()
			
		
		#update ground position
		if $Camera2D.position.x - $Floor.position.x > screen_size.x * 1.5:
			$Floor.position.x += screen_size.x
			
		#remove obstacles that have gone off screen
		for obs in obstacles:
			if obs.position.x < ($Camera2D.position.x - screen_size.x):
				remove_obs(obs)
	else:
		return

var backgrounds = 1
func generate_obs():
	#print(obstacles.is_empty(), last_obs)
	if obstacles.is_empty() or last_obs.position.x < randi_range(100, 500):
		var obs_type = down_obs[randi() % down_obs.size()]
		var obs
		var max_obs = 1
		for i in range(randi() % max_obs + 1):
			obs = obs_type.instantiate()
			var obs_height = obs.get_node("Sprite2D").texture.get_height()
			var obs_scale = obs.get_node("Sprite2D").scale
			var obs_x : int = $Dino.position.x + screen_size.x + 100 + (i * 100)
			var obs_y : int
			obs_y = screen_size.y - (obs_height * obs_scale.y / 2) + 5
			last_obs = obs
			#print(obs_x, obs_y)
			extend_bg()
			add_obs(obs, obs_x, obs_y)

func extend_bg():
	var BG = preload("res://Scenes/Minigame/BG_sprite.tscn")
	var x = 1920 + 1920*backgrounds
	var y = 0
	if $Camera2D.position.x + 800 > 1920*backgrounds:
		backgrounds += 1
		var bg = BG.instantiate()
		#bg.position = Vector2i(x, y)
		bg.position = Vector2i(x, y)
		add_child(bg)
		#print("called")
	

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
		$Dino.is_hit()
		Game_over()
