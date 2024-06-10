extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
var foquito = preload("res://escenas perronas/foquito.tscn")
@onready var saveLoadSystem = load("res://SaveSystem.gd").new()

func _ready():
	var game_data = wasamamaya._get_instance()
	var saveData: Dictionary = saveLoadSystem.load_game()
	game_data.score = saveData["score"]
	game_data.cps = saveData["cps"]
	game_data.cpc = saveData["cpc"]
	game_data.level = saveData["level"]
	game_data.CPS1 = saveData["CPS1"]
	game_data.CPS2 = saveData["CPS2"]
	game_data.CPS3 = saveData["CPS3"]
	game_data.CPS4 = saveData["CPS4"]
	game_data.CPS5 = saveData["CPS5"]
	game_data.CPS6 = saveData["CPS6"]
	game_data.ca1 = saveData["ca1"]
	game_data.ca2 = saveData["ca2"]
	game_data.ca3 = saveData["ca3"]
	game_data.ca4 = saveData["ca4"]
	game_data.ca5 = saveData["ca5"]
	game_data.ca6 = saveData["ca6"]
	print("Datos iniciales cargados: ", saveData)

# Función para guardar el juego
func save_game():
	var game_data = wasamamaya._get_instance()
	saveLoadSystem.save_game(game_data.score, game_data.cps, game_data.cpc, game_data.level, game_data.CPS1, game_data.CPS2, game_data.CPS3, game_data.CPS4, game_data.CPS5, game_data.CPS6, game_data.ca1, game_data.ca2, game_data.ca3, game_data.ca4, game_data.ca5, game_data.ca6)
	print("Juego guardado con los datos: score = %.1f, cps = %.1f, cpc = %d, level = %d, CPS1 = %d, CPS2 = %d, CPS3 = %d, CPS4 = %d, CPS5 = %d, CPS6 = %d, ca1 = %d, ca2 = %d, ca3 = %d, ca4 = %d, ca5 = %d, ca6 = %d" % [
		game_data.score, game_data.cps, game_data.cpc, game_data.level, game_data.CPS1, game_data.CPS2, game_data.CPS3, game_data.CPS4, game_data.CPS5, game_data.CPS6, game_data.ca1, game_data.ca2, game_data.ca3, game_data.ca4, game_data.ca5, game_data.ca6
	])

func _on_Timer_timeout():
	var game_data = wasamamaya._get_instance()
	game_data.score += game_data.cps
	save_game()
