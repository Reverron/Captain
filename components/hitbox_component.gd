extends Area2D
class_name HitboxComponent

signal hit

@export var health_component : HealthComponent
@export var knockback_node : CharacterBody2D

func apply_damage(attack: AttackComponent) -> void:
	hit.emit()
	if health_component: health_component.take_damage(attack)
	if knockback_node:
		_apply_knockback(attack)

func _apply_knockback(attack: AttackComponent) -> void:
	if not knockback_node.has_method("apply_knockback"):
		return
	
	var direction = (global_position - attack.global_position).normalized()
	knockback_node.apply_knockback(direction, attack.attack_knockback, attack.stun_time)
