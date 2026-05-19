extends Node2D

const SPEED = 60

var direction = 1

@onready var RayCast_right = $"RayCast right"
@onready var RayCast_left = $"RayCast left"
@onready var Animated_Sprite = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if RayCast_right.is_colliding():
		direction = -1
		Animated_Sprite.flip_h = true
	if RayCast_left.is_colliding():
		direction = 1
		Animated_Sprite.flip_h = false
	
	position.x += direction * SPEED * delta
