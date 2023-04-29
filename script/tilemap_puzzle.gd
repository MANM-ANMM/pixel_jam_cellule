extends TileMap
class_name TileMapPuzzle

signal cell_clicked(Vector2i)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var cliked_cell = local_to_map(to_local(event.global_position))
			emit_signal("cell_clicked", cliked_cell)

func get_directions_tube(coord:Vector2i)->Array:
	var atlas_coords := get_cell_atlas_coords(0, coord)
	print(atlas_coords, coord)
	if Constantes.entrees_id.has(atlas_coords):
		return Constantes.entrees_id[atlas_coords]
	else:
		return []


func get_entrees_tubes()->Array:
	return get_entrees_sorties_helper(Constantes.couleur_tube_entree_id)

func get_sorties_tubes()->Array:
	return get_entrees_sorties_helper(Constantes.couleur_tube_sortie_id)

func get_entrees_sorties_helper(tab_id_couleur)->Array:
	return get_used_cells(0) \
		.filter(func(c): return tab_id_couleur.has(get_cell_atlas_coords(0, c))) \
		.map(func(c): return {c : tab_id_couleur[get_cell_atlas_coords(0, c)]})



