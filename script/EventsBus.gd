extends Node

# Menus
signal menu_go_to_main
signal menu_go_to_credit
signal menu_go_to_selection
signal menu_start_game
signal menu_quit_game
signal start_level(rang:int)

signal give_me_level_count(Callable)

#Jeu
signal level_ended
signal piece_deplacee
signal defaite
signal vu_par_le_garde
signal victoire

signal temps_jeu(float)
