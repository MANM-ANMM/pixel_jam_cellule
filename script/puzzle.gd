extends Node2D


@export var taille : Vector2
var depart1 := Vector2i(0,0)
var destination1 := Vector2i(3,0)
@onready var tile_map :TileMapPuzzle= $TileMap

func test_chemin()->bool:
	var deplacement_prec := Enums.Direction.Droite 
	var case_actuelle := depart1
	
	while true:
		print(case_actuelle)
		if case_actuelle == destination1:
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

func _on_tile_map_cell_clicked(pos:Vector2i):
	print(test_chemin())
	print(tile_map.get_entrees_tubes())
	print(tile_map.get_sorties_tubes())

