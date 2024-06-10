extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
# Called when the node enters the scene tree for the first time.
@onready var Objetos = $CPS
var PopUp


func _process(delta):
	var game_data = wasamamaya._get_instance()
	PopUp = Objetos.get_popup()
	PopUp.id_pressed.connect(Tienda)
	PopUp.set_item_text(0, "CPS +0.1 : " + str(game_data.CPS1))
	PopUp.set_item_text(1, "CPS+1 : " + str(game_data.CPS2))
	PopUp.set_item_text(2, "CPS +8 : " + str(game_data.CPS3))
	PopUp.set_item_text(3, "CPS+47 : " + str(game_data.CPS4))
	PopUp.set_item_text(4, "CPS +260 : " + str(game_data.CPS5))
	PopUp.set_item_text(5, "CPS+1400 : " + str(game_data.CPS6))
	
	
func Tienda(id):
	var game_data = wasamamaya._get_instance()
	
	print (game_data.score)
	match(id):
		0:
			if game_data.score >= game_data.CPS1:
				game_data.score -= game_data.CPS1
				game_data.CPS1 = (game_data.CPS1 * 1.15)
				PopUp.set_item_text(0, "CPS +0.1 : " + str(game_data.CPS1))
				game_data.cps += 0.1
				game_data.ca1 += 1
				print(game_data.cps)
		1:
			if game_data.score >= game_data.CPS2:
				game_data.score -= game_data.CPS2
				game_data.CPS2 = (game_data.CPS2 * 1.15)
				PopUp.set_item_text(1, "CPS +1 : " + str(game_data.CPS2))
				game_data.cps += 1
				game_data.ca2 += 1
				print(game_data.cps)
		2:
			if game_data.score >= game_data.CPS3:
				game_data.score -= game_data.CPS3
				game_data.CPS3 = (game_data.CPS3 * 1.15)
				PopUp.set_item_text(2, "CPS +8 : " + str(game_data.CPS3))
				game_data.cps += 8
				game_data.ca3 += 1
				print(game_data.cps)
		3:
			if game_data.score >= game_data.CPS4:
				game_data.score -= game_data.CPS4
				game_data.CPS4 = (game_data.CPS4 * 1.15)
				PopUp.set_item_text(3, "CPS +47 : " + str(game_data.CPS4))
				game_data.cps += 47
				game_data.ca4 += 1
				print(game_data.cps)
		4:
			if game_data.score >= game_data.CPS5:
				game_data.score -= game_data.CPS5
				game_data.CPS5 = (game_data.CPS5 * 1.15)
				PopUp.set_item_text(4, "CPS +260 : " + str(game_data.CPS5))
				game_data.cps += 260
				game_data.ca5 += 1
				print(game_data.cps)
		5:
			if game_data.score >= game_data.CPS6:
				game_data.score -= game_data.CPS6
				game_data.CPS6 = (game_data.CPS6 * 1.15)
				PopUp.set_item_text(5, "CPS +1400 : " + str(game_data.CPS6))
				game_data.cps += 1400
				game_data.ca6 += 1
				print(game_data.cps)
