extends Node2D


@export var taille : Vector2
@onready var tile_map :TileMapPuzzle= $TileMap
var fini:=false
var defaite:=false :
	set(value):
		defaite = value
		if defaite:
			fini = true

func test_chemin(depart:Vector2i,arriver:Vector2i)->bool:
	var deplacement_prec := Enums.Direction.Droite
	var case_actuelle := depart + Enums.direction_to_vec(Enums.Direction.Droite)
	
	while true:
		if case_actuelle == arriver:
			break
		
		var dirs := tile_map.get_directions_tube(case_actuelle)
		if not dirs.has(Enums.direction_oposee(deplacement_prec)):
			return false
		
		dirs = dirs.filter(func(d): return d != Enums.direction_oposee(deplacement_prec))
		if dirs.size() == 0:
			return false
		elif dirs.size() == 1:
			case_actuelle += Enums.direction_to_vec(dirs.front())
			deplacement_prec = dirs.front()
		elif dirs.size() == 3:
			case_actuelle += Enums.direction_to_vec(deplacement_prec)
	
	return true

var coord1 := Vector2i(-1,-1)
func _on_tile_map_cell_clicked(pos:Vector2i):
	if fini or not((pos.x>-1 and pos.x<taille.x) and (pos.y>-1 and pos.y <taille.y)):
		coord1 = Vector2i(-1,-1)
		return
	
	if coord1 != Vector2i(-1,-1):
		if tile_map.adjacence(pos,coord1) and not tile_map.is_there_cell(pos):
			tile_map.deplacer_cellule(coord1,pos)
			EventsBus.emit_signal("piece_deplacee")
			if tuyau_relier():
				terminaison_niveau()
			coord1 = Vector2i(-1,-1)
		else:
			coord1 = pos
	elif tile_map.is_there_cell(pos):
		coord1 = pos
		
func chercher_arriver(couleur:int,tableau:Array)->int:
	var i := 0
	while tableau[i][1] != couleur:
		i+=1
	return(i)

func tuyau_relier()->bool:
	var tabdepart := tile_map.get_entrees_tubes()
	var tabarriver := tile_map.get_sorties_tubes()
	for dep in tabdepart:
		if not test_chemin(tabdepart[dep], tabarriver[dep]):
			return false
	return true


func terminaison_niveau():
	if defaite:
		return
	fini = true
	var tabdepart := tile_map.get_entrees_tubes()
	var tween = get_tree().create_tween()
	for dep in tabdepart:
		remplisagetube(tabdepart[dep], dep)
	tween.tween_interval(3)
	print("gagner")
	
	tween.tween_callback(func() : EventsBus.emit_signal("level_ended"))

func remplisagetube(depart:Vector2i, couleur:Enums.CouleurTube):
	var deplacement_prec := Enums.Direction.Droite
	var case_actuelle := depart + Enums.direction_to_vec(Enums.Direction.Droite)
	var tween = get_tree().create_tween()
	
	while true:
		tween.tween_interval(0.2)
		var atlas_actuel := tile_map.get_cell_atlas_coords(0,case_actuelle)
		if Constantes.atlas_coord_color.has(atlas_actuel): 
			var nouvel_atlas = Constantes.atlas_coord_color[atlas_actuel][couleur] 
			tween.tween_callback(func() : tile_map.set_cell(0, case_actuelle, 1, nouvel_atlas))
		
		if Constantes.couleur_tube_sortie_id.has(tile_map.get_cell_atlas_coords(0, case_actuelle)) :
			break
		
		var dirs := tile_map.get_directions_tube(case_actuelle)
		if not dirs.has(Enums.direction_oposee(deplacement_prec)):
			break
		
		dirs = dirs.filter(func(d): return d != Enums.direction_oposee(deplacement_prec))
		if dirs.size() == 1:
			case_actuelle += Enums.direction_to_vec(dirs.front())
			deplacement_prec = dirs.front()
		elif dirs.size() == 3:
			case_actuelle += Enums.direction_to_vec(deplacement_prec)
	
	
	
	
