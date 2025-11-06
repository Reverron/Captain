extends CanvasLayer
class_name MiniMap

@onready var background: TextureRect = %Background

@export var player: Player
var player_marker
var markers := {}

@export var scan_radius := 200.0
@export var zoom := 1.0

func _ready() -> void:
	init_player_marker()
	get_minimap_objs()
	#background.size = Vector2(scan_radius, scan_radius)
	#background.set_anchors_preset(Control.PRESET_CENTER)

func _physics_process(_delta: float) -> void:
	if not player: return
	if player_marker: player_marker.rotation = player.rotation
	for obj in markers:
		var obj_pos = obj.global_position - player.global_position + Vector2(get_window().size / 2)
		obj_pos.x = clamp(obj_pos.x, 0, get_window().size.x)
		obj_pos.y = clamp(obj_pos.y, 0, get_window().size.y)
		markers[obj].position = obj_pos

func init_player_marker():
	if not player: 
		return
	player_marker = player.get_node("RadarObjComponent")
	if player_marker:
		player_marker.reparent(background)
		player_marker.show()
		player_marker.global_position = get_window().size / 2

func get_minimap_objs():
	var map_objs = get_tree().get_nodes_in_group("radar_objs")
	for obj in map_objs:
		var marker = obj.get_node("RadarObjComponent")
		if marker:
			marker.reparent(background)
			marker.show()
			markers[obj] = marker
