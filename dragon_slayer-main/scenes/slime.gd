extends Node2D

const speed = 60
var directions = 1

@onready var ray_cast_2d_right: RayCast2D = $RayCast2D_right
@onready var ray_cast_2d_left: RayCast2D = $RayCast2D2_LEFT
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d_right.is_colliding():
		directions = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_left.is_colliding():
		directions = 1
		animated_sprite_2d.flip_h = false

	position.x += directions * speed * delta
