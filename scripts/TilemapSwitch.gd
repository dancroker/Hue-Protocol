extends Node2D

@onready var ground: TileMap = $Node/Ground
@onready var ground_blue: TileMap = $"Node/Ground Blue"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var direction := Input.is_action_pressed("Switch Mask")
	if Input.is_action_pressed("Switch Mask"):
		if ground.visible == false:
			ground.visible = true
			ground_blue.visible = false
		elif ground.visible == true:
			ground.visible = false
			ground_blue.visible = true
