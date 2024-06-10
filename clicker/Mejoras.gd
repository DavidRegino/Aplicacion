extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
# Called when the node enters the scene tree for the first time.
@onready var Objetos = $CPS
var PopUp


func _process(delta):
	var game_data = wasamamaya._get_instance()
	PopUp = Objetos.get_popup()
	PopUp.id_pressed.connect(Tienda)
	PopUp.set_item_text(0, "CPC +1 : " + str(game_data.M1))
	
	
func Tienda(id):
	var game_data = wasamamaya._get_instance()
	
	print (game_data.score)
	match(id):
		0:
			if game_data.score >= game_data.M1:
				game_data.score -= game_data.M1
				game_data.M1 = (game_data.M1 * 1.15)
				PopUp.set_item_text(0, "CPC +1 : " + str(game_data.M1))
				game_data.cpc += 1
				game_data.cm1 += 1
				print(game_data.cps)
