extends Node
class_name PauseComponent

@export var is_paused := true : set = _toggle_pause

func _toggle_pause(pause: bool):
	is_paused = pause
