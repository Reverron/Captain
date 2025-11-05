extends Camera2D
class_name MiniMapCam

@export var scan_radius := 50.0
var player: Player
@export var pois: Array[Node2D] = []

func _ready() -> void:
	#pois = GameManager.main.cities
	#player = GameManager.get_player()
	zoom = Vector2(scan_radius, scan_radius)

func _process(_delta: float) -> void:
	position = Vector2(player.position.x, player.position.y)
	var player_pos = player.global_transform.origin
	for poi in pois:
		var poi_pos = poi.global_transform.origin
		var offset = Vector3(poi_pos.x, 0, poi_pos.z) - Vector3(player_pos.x, 0, player_pos.z)
		var distance = offset.length()
		if distance > scan_radius / 2:
			# Clamp to minimap edge
			var clamped_offset = offset.normalized() * (scan_radius / 2 - 3.0)
			poi.minimap_icon.global_transform.origin = Vector3(
				player_pos.x + clamped_offset.x,
				global_transform.origin.y - 10,
				player_pos.z + clamped_offset.z)
			poi.minimap_icon.scale = Vector3(10, 10, 1)
		else:
			poi.minimap_icon.global_transform.origin = Vector3(
				poi_pos.x,
				global_transform.origin.y - 10,
				poi_pos.z)
			poi.minimap_icon.scale = Vector3(15, 15, 1)
		
		var height_diff = abs(poi_pos.y - player_pos.y)
		if height_diff <= 15.0:
			poi.minimap_icon.modulate.a = 1.0
		elif height_diff <= 50.0:
			poi.minimap_icon.modulate.a = 0.7
		else:
			poi.minimap_icon.modulate.a = 0.3
