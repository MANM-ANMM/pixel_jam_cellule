extends Node2D


@export var taille : Vector2
@onready var tile_map :TileMapPuzzle= $TileMap

func test_chemin(depart:Vector2i,arriver:Vector2i)->bool:
	var deplacement_prec := Enums.Direction.Droite 
	var case_actuelle := depart
	
	while true:
		print(case_actuelle)
		if case_actuelle == arriver:
			break
		
		var dirs := tile_map.get_directions_tube(case_actuelle)
		print(dirs)
		print(Enums.direction_oposee(deplacement_prec))
		if not dirs.has(Enums.direction_oposee(deplacement_prec)):
			return false
		
		dirs = dirs.filter(func(d): return d != Enums.direction_oposee(deplacement_prec))
		print(dirs)
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
	if not((pos.x>-1 and pos.x<taille.x) and (pos.y>-1 and pos.y <taille.y)):
		coord1 = Vector2i(-1,-1)
		return
	print(pos)
	if coord1 != Vector2i(-1,-1):
		if tile_map.adjacence(pos,coord1):
			tile_map.deplacer_cellule(coord1,pos)
			if tuyau_relier():
				print("gagner")
			coord1 = Vector2i(-1,-1)
			
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
	var idarr := -1
	for dep in tabdepart :
		idarr = chercher_arriver(dep[1],tabarriver)
		if not(test_chemin(dep[0],tabarriver[idarr][0])):
			return false
	return true
	
