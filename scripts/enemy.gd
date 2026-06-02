extends Node2D
class_name enemy


const SPEED = 60

var direction = 1

@onready var leftarrow: RayCast2D = $leftarrow
@onready var rightarrow: RayCast2D = $rightarrow

@onready var Animated_Sprite = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if rightarrow.is_colliding():
		direction = -1
		Animated_Sprite.flip_h = true
	if leftarrow.is_colliding():
		direction = 1
		Animated_Sprite.flip_h = false
	
	position.x += direction * SPEED * delta
	
	

func die():
	queue_free()
