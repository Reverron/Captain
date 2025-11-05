extends TextureRect

var scrolling_speed := 1.0

func _physics_process(delta: float) -> void:
	position.y = move_toward(position.y, 0, scrolling_speed * delta)

func update_scrolling_speed(_scale: float):
	scrolling_speed *= _scale
