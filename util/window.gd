extends Window
class_name Wwindow

@export var x := 0
@export var y := 400

@export var width_range: Vector2i = Vector2i(300, 500)
@export var height_range: Vector2i = Vector2i(300, 500)

@export var max_distance: float = 500.0  # beyond this, window is minimum size
@export var min_window_size: Vector2i = Vector2i(150, 150)

@onready var player: Player = %Player

func random_size() -> Vector2i:
	return Vector2(randi_range(width_range.x, width_range.y), randi_range(height_range.x, height_range.y))

func init_window(_x: float, _y: float):
	position.x = int(_x)
	position.y = int(_y)
	#resize_window(random_size())
	
	if not player or not is_instance_valid(player) or not Global.get_captain():
		return
	var dist := player.global_transform.origin.distance_to(Global.get_captain().global_transform.origin)
	var t : float = clamp(dist / max_distance, 0.0, 1.0)  # 0 = close, 1 = far

	var target_w = lerp(width_range.y, width_range.x, t)
	var target_h = lerp(height_range.y, height_range.x, t)
	var target_size = Vector2i(target_w, target_h)
	resize_window(target_size)

func _ready() -> void:
	position.x = x
	position.y = y

func resize_window(target_size: Vector2i):
	unresizable = false
	var tween := create_tween()
	tween.tween_property(self, "size", target_size, 0.2)
	tween.finished.connect(func(): unresizable = true)
	if target_size.x <= min_window_size.x or target_size.y <= min_window_size.y:
		queue_free()

func _on_focus_entered() -> void:
	if player: player.can_control = true

func _on_focus_exited() -> void:
	if player: player.can_control = false
