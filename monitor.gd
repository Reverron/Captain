extends Node3D
class_name Monitor

@onready var blades: MeshInstance3D = $Env/Ventilation_2/Ventilation_2_blades

var target_speed := 0.0 
var current_speed := 0.0
var accel := 0.5

func _process(delta: float) -> void:
	current_speed = lerp(current_speed, target_speed, delta * accel)
	blades.rotate_z(current_speed * delta)
