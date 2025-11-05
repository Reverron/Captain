extends CharacterBody2D
class_name Pickup

@export var item_data: ItemData
@export var quantity: int = 1

@onready var interaction: InteractionComponent = $InteractionComponent
@onready var sprite: Sprite2D = $Sprite2D

var texture: AtlasTexture
var frame: int = 0
@export var frame_count: int = 12
@export var frame_speed: float = 10.0
var frame_timer: float = 0.0

func _ready() -> void:
	if interaction:
		interaction.interact = Callable(self, "_on_pickup")

	var t := sprite.texture as AtlasTexture
	if t != null:
		texture = t

func _physics_process(delta: float) -> void:
	_anim_sprite(delta)

func _on_pickup(interactor: Node) -> void:
	if interactor.has_node("InventoryComponent"):
		var inv = interactor.get_node("InventoryComponent") as InventoryComponent
		inv.add_item(item_data, quantity)
	call_deferred("queue_free")

func _anim_sprite(delta: float):
	if texture == null:
		return

	frame_timer += delta
	if frame_timer >= 1.0 / frame_speed:
		frame_timer = 0.0
		frame = (frame + 1) % frame_count

		var region := texture.region
		region.position.x = frame * region.size.x
		texture.region = region
		sprite.texture = texture
