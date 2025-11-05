extends Node
class_name Root

signal update_game_speed(scale: float)
@onready var background: Background = %Background

func _change_game_speed(scale: float):
	update_game_speed.emit(scale)
