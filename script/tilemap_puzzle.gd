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
	if Constantes.entrees_id.has(atlas_coords):
		return Constantes.entrees_id[atlas_coords]
	else:
		return []


func get_entrees_tubes()->Dictionary:
	return get_entrees_sorties_helper(Constantes.couleur_tube_entree_id)

func get_sorties_tubes()->Dictionary:
	return get_entrees_sorties_helper(Constantes.couleur_tube_sortie_id)

func get_entrees_sorties_helper(tab_id_couleur)->Dictionary:
	var dict:Dictionary
	var cells = get_used_cells(0) \
		.filter(func(c): return tab_id_couleur.has(get_cell_atlas_coords(0, c)))
	
	for c in cells:
		dict[tab_id_couleur[get_cell_atlas_coords(0, c)]] = c
	return dict

func is_there_cell(coord:Vector2i)->bool:
	var pre := get_cell_source_id(0, coord)
	return(pre != -1)
	
func adjacence(source:Vector2i, dest:Vector2i)->bool:
	return(abs(source.x-dest.x)+abs(source.y-dest.y) == 1)
		
func deplacer_cellule(source:Vector2i, dest:Vector2i):
	if (is_there_cell(source)==true) and (is_there_cell(dest)==false):
		set_cell(0,dest,0,get_cell_atlas_coords(0,source))
		set_cell(0, source)

		

	
