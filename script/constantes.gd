extends Node

var entrees_id := {
	#angle
	Vector2i(1,1): [Enums.Direction.Haut, Enums.Direction.Gauche],
	Vector2i(1,2): [Enums.Direction.Haut, Enums.Direction.Droite],
	Vector2i(2,3): [Enums.Direction.Bas, Enums.Direction.Gauche],
	Vector2i(1,3): [Enums.Direction.Bas, Enums.Direction.Droite],
	
	#droite
	Vector2i(2,1): [Enums.Direction.Bas, Enums.Direction.Haut],
	Vector2i(2,2): [Enums.Direction.Gauche, Enums.Direction.Droite],
	
	#croisements
	Vector2i(3,1): [Enums.Direction.Bas, Enums.Direction.Haut, Enums.Direction.Gauche, Enums.Direction.Droite],
	Vector2i(3,2): [Enums.Direction.Bas, Enums.Direction.Haut, Enums.Direction.Gauche, Enums.Direction.Droite],
	Vector2i(3,3): [Enums.Direction.Bas, Enums.Direction.Haut, Enums.Direction.Gauche, Enums.Direction.Droite],
	
	#sortie
	Vector2i(4,1): [Enums.Direction.Gauche],
	Vector2i(4,2): [Enums.Direction.Gauche],
	Vector2i(4,3): [Enums.Direction.Gauche],
	
	Vector2i(1,4): [Enums.Direction.Haut],
	Vector2i(2,4): [Enums.Direction.Haut],
	Vector2i(3,4): [Enums.Direction.Haut],

	#entree
	Vector2i(0,1): [Enums.Direction.Droite],
	Vector2i(0,2): [Enums.Direction.Droite],
	Vector2i(0,3): [Enums.Direction.Droite],

	Vector2i(1,0): [Enums.Direction.Bas],
	Vector2i(2,0): [Enums.Direction.Bas],
	Vector2i(3,0): [Enums.Direction.Bas],
}

var couleur_tube_entree_id := {
	Vector2i(0,1): Enums.CouleurTube.Rouge,
	Vector2i(0,2): Enums.CouleurTube.Vert,
	Vector2i(0,3): Enums.CouleurTube.Jaune,

	Vector2i(1,0): Enums.CouleurTube.Rouge,
	Vector2i(2,0): Enums.CouleurTube.Vert,
	Vector2i(3,0): Enums.CouleurTube.Jaune,
}

var couleur_tube_sortie_id := {
	Vector2i(4,1): Enums.CouleurTube.Rouge,
	Vector2i(4,2): Enums.CouleurTube.Vert,
	Vector2i(4,3): Enums.CouleurTube.Jaune,
	
	Vector2i(1,4): Enums.CouleurTube.Jaune,
	Vector2i(2,4): Enums.CouleurTube.Vert,
	Vector2i(3,4): Enums.CouleurTube.Rouge,
}
