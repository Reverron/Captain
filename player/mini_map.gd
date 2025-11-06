extends CanvasLayer
class_name MiniMap

@onready var background: TextureRect = %Background

@export var player: Player
var pois: Array[Node2D] = []
var markers: Array[Sprite2D] = []

var map_scale
@export var scan_radius := 50.0
@export var zoom := 1.0

func _ready() -> void:
	init_player_marker()
	get_minimap_objs()
	#size = Vector2(scan_radius, scan_radius)
	#map_scale = background.get_rect().size / (get_viewport_rect().size * zoom)

#func _physics_process(_delta: float) -> void:
	#if player: position = Vector2(player.position.x, player.position.y)
	#var player_pos = player.global_transform.origin if player else Vector2.ZERO
	#for poi in pois:
		#var poi_pos = poi.global_transform.origin
		#var _offset = Vector2(poi_pos.x, poi_pos.y) - Vector2(player_pos.x, player_pos.y)
		#var distance = _offset.length()
		#if distance > scan_radius / 2:
			## Clamp to minimap edge
			##var clamped_offset = _offset.normalized() * (scan_radius / 2 - 3.0)
			##poi.icon.global_transform.origin = Vector2(
				##player_pos.x + clamped_offset.x,
				##player_pos.y + clamped_offset.y)
			##poi.icon.scale = Vector2(2, 2)
			#poi.icon.hide()
		#else:
			#poi.icon.show()
			#poi.icon.global_transform.origin = Vector2(
				#poi_pos.x,
				#poi_pos.y)
			#poi.icon.scale = Vector2(2, 2)

func init_player_marker():
	if not player: 
		return
	var player_marker = player.get_node("RadarObjComponent")
	if player_marker:
		player_marker.show()
		player_marker.global_position = get_window().size / 2

func get_minimap_objs():
	var map_objs = get_tree().get_nodes_in_group("radar_objs")
	for o in map_objs:
		var marker = o.get_node("RadarObjComponent")
		marker.reparent(background)
		marker.show()
		markers.append(marker)
