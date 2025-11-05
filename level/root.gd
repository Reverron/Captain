extends Node
class_name Root

signal update_game_speed(scale: float)

#@onready var sub_viewport: SubViewport = $WindowsManager/Screen_Captain/SubViewport
#@onready var sub_viewport1: SubViewport = $HBoxContainer/SplitScreen/SubViewport
#@onready var sub_viewport2: SubViewport = $HBoxContainer/SplitScreen2/SubViewport
#
#func _ready() -> void:
	#var world = sub_viewport1.find_world_2d()
	#sub_viewport1.world_2d = world
	#sub_viewport2.world_2d = world

func _change_game_speed(scale: float):
	update_game_speed.emit(scale)
