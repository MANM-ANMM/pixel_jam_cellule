extends Node

enum Direction {
	Haut,
	Bas,
	Gauche,
	Droite
}

func direction_oposee(dir:Direction)-> Direction:
	match dir:
		Direction.Haut: 
			return Direction.Bas
		Direction.Bas: 
			return Direction.Haut
		Direction.Droite: 
			return Direction.Gauche
		Direction.Gauche: 
			return Direction.Droite
	
	print("Should not append")
	return Direction.Haut

func direction_to_vec(dir:Direction)-> Vector2i:
	match dir:
		Direction.Haut: 
			return Vector2i(0, -1)
		Direction.Bas: 
			return Vector2i(0, 1)
		Direction.Droite: 
			return Vector2i(1, 0)
		Direction.Gauche: 
			return Vector2i(-1, 0)
	
	print("Should not append")
	return Vector2i(0, 0)
	
