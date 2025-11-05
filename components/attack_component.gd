extends Area2D
class_name AttackComponent

@export var attack_damage := 1
@export var attack_knockback := 100.0
@export var stun_time := 0.3

func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(area: Area2D):
	if area is HitboxComponent:
		area.apply_damage(self)
		get_parent().queue_free()
