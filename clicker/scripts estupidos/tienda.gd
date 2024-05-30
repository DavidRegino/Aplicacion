extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
# Called when the node enters the scene tree for the first time.
@onready var Objetos = $CPS
var PopUp


func _ready():
	var game_data = wasamamaya._get_instance()
	PopUp = Objetos.get_popup()
	PopUp.id_pressed.connect(Tienda)
	PopUp.set_item_text(0, "CPS +0.1 : " + str(game_data.TiendaCPC))
	PopUp.set_item_text(1, "CPS+1 : " + str(game_data.TiendaCPS))
	print(game_data.score)
	
func Tienda(id):
	var game_data = wasamamaya._get_instance()
	
	print (game_data.score)
	match(id):
		0:
			if game_data.score >= game_data.TiendaCPS:
				game_data.score -= game_data.TiendaCPS
				game_data.TiendaCPS = (game_data.TiendaCPS * 1.5)
				PopUp.set_item_text(0, "CPS +0.1 : " + str(game_data.TiendaCPS))
				game_data.cps += 0.1
				print(game_data.cps)
				print(game_data.TiendaCPS)
		1:
			if game_data.score >= game_data.TiendaCPS:
				game_data.score -= game_data.TiendaCPS
				game_data.cps += 1
				print(game_data.cps)
