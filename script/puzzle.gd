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

var coord1 := Vector2i(-1,-1)
func _on_tile_map_cell_clicked(pos:Vector2i):
	if not((pos.x>-1 and pos.x<taille.x) and (pos.y>-1 and pos.y <taille.y)):
		coord1 = Vector2i(-1,-1)
		return
	print(pos)
	if coord1 != Vector2i(-1,-1):
		if tile_map.adjacence(pos,coord1):
			tile_map.deplacer_cellule(coord1,pos)
			coord1 = Vector2i(-1,-1)
	elif tile_map.is_there_cell(pos):
		coord1 = pos


