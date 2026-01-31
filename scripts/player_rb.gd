extends RigidBody2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D

const MAX_SPEED = 100.0
const MOVE_SPEED = 100.0
const JUMP_FORCE = -100.0
var MAX_NUM_JUMP = 1
var jump_vairable = -200
var MASK_EQUIPT = 0;



func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	var force = Vector2.ZERO

	if direction:
		force.x = MOVE_SPEED * direction
		if abs(linear_velocity.x) > MAX_SPEED: 
			linear_velocity.x = MAX_SPEED  * direction
	if _on_floor() and Input.is_action_pressed("ui_accept"):
		force.y += JUMP_FORCE
		if jump_vairable > -500:
			jump_vairable -= 10
		
	
	apply_central_impulse(force)

func _intergrate_forces(state):
	rotation_degrees = 0

func _on_floor():
	if ray_cast_2d.is_colliding():
		print("is collidongt")
		return true


	
