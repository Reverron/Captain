extends Node2D
class_name  RadarObjComponent

@onready var icon: Sprite2D = $MiniMapIcon

func _on_button_mouse_entered() -> void:
	print("!")
