extends Node2D
class_name Main

@export var is_paused := false
@export var speed := 5.0

func _ready() -> void:
	Global.game_setup()

func _physics_process(delta: float) -> void:
	if is_paused:
		return
	
	global_position.y += speed * Global.game_speed * delta
