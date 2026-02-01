extends ColorRect
var MIN_X
var time
var pause
@onready var character_body_2d: CharacterBody2D = $"../../CharacterBody2D"
@onready var label: Label = $"../Label"
@export var label_2: Label




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MIN_X= global_position.x
	time = 0
	pause = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var precentage = character_body_2d.player_completion_percentage()
	precentage = precentage.replace(".0","")
	label.text = precentage + "%"
	if pause >=60:
		time+=1
		pause = 0
	else:
		pause +=1
		label_2.text = str(time)
	if Input.is_action_just_pressed("Restart"):
		time = 0
		pause = 0
	pass
	
