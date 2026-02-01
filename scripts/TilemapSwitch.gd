extends Node2D

#@onready var ground: TileMap = $Node/Ground
@onready var ground_blue: TileMapLayer = $"Ground Blue"
@onready var ground: TileMapLayer = $"Ground Red"

var MASK_EQUIPT = 0;
# C$Node/Layer0alled when the node enters the scene tree for the first time.
func _ready() -> void:
	ground.visible=!ground.visible
	ground.collision_enabled = !ground_blue.collision_enabled
	pass # Replace with function body.


func _process(delta: float) -> void:
	#var direction := Input.is_action_pressed("Switch Mask")
	SwitchTile()
	pass
	
func SwitchTile():
	if Input.is_action_just_pressed("Mask Red"):
		set_mask(1)
		print("mask red")
		ground_blue.collision_enabled = !ground_blue.collision_enabled
		ground.collision_enabled = !ground_blue.collision_enabled
		ground.visible=!ground.visible
		ground_blue.visible=!ground_blue.visible
	if Input.is_action_just_pressed("Mask Blue"):
		set_mask(2)
		print("mask blue")
func get_mask():
	return MASK_EQUIPT
	
	
func set_mask(set_value):
	MASK_EQUIPT = set_value
	# 0 = None
	# 1 = Red
	# 2 = Blue
	# 3 = Both
