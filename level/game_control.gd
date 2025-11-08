extends CanvasLayer
class_name GameControl

@onready var button: Button = $SubViewportContainer/SubViewport/Background/VBoxContainer/Button
@onready var button_2: Button = $SubViewportContainer/SubViewport/Background/VBoxContainer/Button2
@onready var button_3: Button = $SubViewportContainer/SubViewport/Background/VBoxContainer/Button3

func _ready() -> void:
	button.is_hovered()
