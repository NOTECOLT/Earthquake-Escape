extends CharacterBody2D

const GRAVITY : int = 2100
const JUMP_SPEED : int = -800

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
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
