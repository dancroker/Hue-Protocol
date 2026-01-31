extends Node2D

#@onready var ground: TileMap = $Node/Ground
@onready var ground_blue: TileMapLayer = $"Node/Ground Blue"
@onready var ground: TileMapLayer = $Node/Layer0

# C$Node/Layer0alled when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


func _process(delta: float) -> void:
	#var direction := Input.is_action_pressed("Switch Mask")
	SwitchTile()
	pass
	
func SwitchTile():
	if Input.is_action_just_pressed("Switch Mask"):
		ground_blue.collision_enabled = !ground_blue.collision_enabled
		ground.visible=!ground.visible
		ground_blue.visible=!ground_blue.visible
		
