extends CharacterBody2D

var GRAVITY : int = 2000
var JUMP_SPEED : int = -1000
var collided = false

func is_hit():
	collided = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if collided:
		$AnimatedSprite2D.play("hit")
	elif is_on_floor():
		$Run.disabled = false
		if Input.is_action_pressed("ui_accept"):
			velocity.y = JUMP_SPEED
			#$JumpSound.play()
		elif Input.is_action_pressed("ui_down"):
			$AnimatedSprite2D.play("duck")
			$Run.disabled = true
		else:
			$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("jump")
		
	move_and_slide()
