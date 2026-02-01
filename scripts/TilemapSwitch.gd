extends Node2D

#@onready var ground: TileMap = $Node/Ground
@onready var ground_blue: TileMapLayer = $"Ground Blue"
@onready var ground: TileMapLayer = $"Ground Red"
@onready var color_rect: ColorRect = $"../CanvasLayer/ColorRect"
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"
var s = false
var MASK_EQUIPT = 0;
# C$Node/Layer0alled when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.play()
	ground.visible=!ground.visible
	ground.collision_enabled = !ground_blue.collision_enabled
	pass # Replace with function body.


func _process(delta: float) -> void:
	#var direction := Input.is_action_pressed("Switch Mask")
	SwitchTile()
	pass
	
func SwitchTile():
	if Input.is_action_just_pressed("Mask Red"):
		s=!s
		AudioServer.set_bus_bypass_effects(0,s)
		set_mask(1)
		print("mask red")
		ground_blue.collision_enabled = !ground_blue.collision_enabled
		ground.collision_enabled = !ground_blue.collision_enabled
		ground.visible=!ground.visible
		ground_blue.visible=!ground_blue.visible
		color_rect.visible= !color_rect.visible

func get_mask():
	return MASK_EQUIPT
	
	
func set_mask(set_value):
	MASK_EQUIPT = set_value
	# 0 = None
	# 1 = Red
	# 2 = Blue
	# 3 = Both
