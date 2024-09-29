extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 70.0  # Reduced speed for better control
const JUMP_VELOCITY = -300.0
const GRAVITY = 1000.0  # Adjust this value to control falling speed

func _physics_process(delta: float) -> void:
	# Add gravity when not on the floor
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0  # Reset vertical velocity when on the floor

	# Handle jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction for left and right movement
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	#player animation 
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idel")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play('jump')
	
	
	
	
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta*2)

	# Apply movement using the built-in move_and_slide() method
	move_and_slide()
