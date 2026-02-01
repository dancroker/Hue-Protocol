extends CharacterBody2D

const SPEED = 175.0
const JUMP_VELOCITY = -600.0
var MAX_NUM_JUMP = 1
var jump_vairable = -200
var MASK_EQUIPT = 0;
var player_completion = 0;
var player_y = 0;
var jump_calc = 0;
var jump_precentage = 0
var text

@onready var label: Label = $Label
@onready var _animated_sprite = $AnimatedSprite2D

@onready var jump_sfx: AudioStreamPlayer = $JumpSfx
@onready var jump_charge_sfx: AudioStreamPlayer = $JumpChargeSfx
var jump_charge_sfx_played = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		
		MAX_NUM_JUMP=1
	# Handle jump.
	if Input.is_action_pressed("ui_accept") and MAX_NUM_JUMP > 0:
		if jump_vairable > -600:
			jump_vairable -= 10
			#_animated_sprite.play("charging")
		
		if not jump_charge_sfx_played:
			jump_charge_sfx.play()
			jump_charge_sfx_played = true
		
	if Input.is_action_just_released("ui_accept") and is_on_floor():
		MAX_NUM_JUMP -=1
		velocity.y = jump_vairable
		jump_vairable = -200
		_animated_sprite.play("jump")
		#velocity.y = JUMP_VELOCITY
		
		jump_charge_sfx.stop()
		jump_charge_sfx_played = false
		jump_sfx.pitch_scale = randf_range(0.9,1.1)
		jump_sfx.play()
		
	#if is_on_wall() and Input.is_action_just_pressed("ui_accept") and MAX_NUM_JUMP > 0:
		#MAX_NUM_JUMP -= 1
		#velocity.y = JUMP_VELOCITY
	#run anim

		
		

		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if !Input.is_action_pressed("ui_accept"):
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction > 0: direction = 1
		if direction < 0: direction = -1
		if direction:
			_animated_sprite.play("walk")
			velocity.x = direction * SPEED
			_animated_sprite.scale.x = direction * -10
			screen_wrap()
		else:
			_animated_sprite.play("charging")
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x = 0
		_animated_sprite.play("idol")
	player_completion_percentage()
	var text = player_jump_precentage()
	text = text.replace(".0","")
	text = text+"%"
	label.text = text
		



	move_and_slide()
@onready var screen_size = get_viewport_rect().size


func screen_wrap():
	if position.x > screen_size.x:
		position.x = 0
	elif position.x < 0:
		position.x = screen_size.x

func player_completion_percentage():
	player_y = position.y - 594
	if player_y < 0:
		player_y = player_y*-1
	player_completion = ((player_y/ (160*32)))*100
	player_completion = floor(player_completion)
	int(player_completion)
	if player_completion > 100:
		player_completion = 100
	return str(player_completion)

func player_jump_precentage():
	jump_calc = jump_vairable + 200
	if jump_calc < 0:
		jump_calc = jump_calc*-1
	jump_precentage = (float(jump_calc)/400)*100
	return str(jump_precentage)
	

	
