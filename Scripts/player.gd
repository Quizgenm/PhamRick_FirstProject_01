extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -350.0
const DASH_MULTI = 2.0


var double_jump = false
var can_dash = true
var got_dash = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
		if double_jump == false:
				double_jump = true
				jump()

	var direction := Input.get_axis("move_Left", "move_Right")
	# input direction, -1,0,1
	
	
	# flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
		
	
	#animations
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
	
	#applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("dash") and can_dash:
		dash(direction)
		animated_sprite.play("dashroll")
	
	move_and_slide()
	
func jump(multi: float = 1 ):
	velocity.y = JUMP_VELOCITY * multi
	
func dash(direction: float):
	global_position.x = (direction * SPEED) + global_position.x 
	can_dash = false 
	print("I'M DASHING HERE")
	
	
func on_get_fruit() -> void:
	can_dash = true
	
	
	# dash fruit not working like coin, also add dash thing
	
