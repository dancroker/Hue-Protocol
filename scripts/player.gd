extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var MAX_NUM_JUMP = 1
var jump_vairable = -100
var MASK_EQUIPT = 0;


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		MAX_NUM_JUMP=1
	# Handle jump.
	if Input.is_action_pressed("ui_accept") and MAX_NUM_JUMP > 0:
		if jump_vairable > -700:
			jump_vairable -= 10
	if Input.is_action_just_released("ui_accept") and is_on_floor():
		MAX_NUM_JUMP -=1
		velocity.y = jump_vairable
		jump_vairable = -200
		#velocity.y = JUMP_VELOCITY
		
	if is_on_wall() and Input.is_action_just_pressed("ui_accept") and MAX_NUM_JUMP > 0:
		MAX_NUM_JUMP -= 1
		velocity.y = JUMP_VELOCITY
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")


	if direction:
		velocity.x = direction * SPEED
		screen_wrap()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	



	move_and_slide()
@onready var screen_size = get_viewport_rect().size

func get_mask():
	return MASK_EQUIPT

func screen_wrap():
	if position.x > screen_size.x:
		position.x = 0
	elif position.x < 0:
		position.x = screen_size.x

	
func set_mask(set_value):
	MASK_EQUIPT = set_value
	# 0 = None
	# 1 = Red
	# 2 = Blue
