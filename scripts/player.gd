extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var MAX_NUM_JUMP = 2


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		MAX_NUM_JUMP=2
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and MAX_NUM_JUMP > 0:
		MAX_NUM_JUMP -=1
		
		velocity.y = JUMP_VELOCITY
		print(MAX_NUM_JUMP)
	if is_on_wall() and Input.is_action_just_pressed("ui_accept") and MAX_NUM_JUMP > 0:
		MAX_NUM_JUMP -= 1
		velocity.y = JUMP_VELOCITY
		print(MAX_NUM_JUMP)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
