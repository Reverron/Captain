extends Area2D
class_name InteractionComponent

@export var interact_name := "Pickup"
@export var interact_duration := 1.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body is Player:
		body.interaction_controller.register_area(self)

func _on_body_exited(body: Node) -> void:
	if body is Player:
		body.interaction_controller.unregister_area(self)

var interact: Callable = func(_interactor : Node):
	pass
