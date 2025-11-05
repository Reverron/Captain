extends Window

@export var x := 0
@export var y := 400

func _ready() -> void:
	position.x = x
	position.y = y
