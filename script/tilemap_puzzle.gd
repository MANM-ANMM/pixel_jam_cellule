extends TileMap
class_name TileMapPuzzle

signal cell_clicked(Vector2i)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var cliked_cell = local_to_map(to_local(event.global_position))
			emit_signal("cell_clicked", cliked_cell)

func get_entree_tube(coord:Vector2i)->Array:
	var atlas_coords := get_cell_atlas_coords(0, coord)
	print(atlas_coords, coord)
	if Constantes.entrees_id.has(atlas_coords):
		return Constantes.entrees_id[atlas_coords]
	else:
		return []
