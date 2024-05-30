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
	print("Datos iniciales cargados: ", saveData)

# Función para guardar el juego
func save_game():
	var game_data = wasamamaya._get_instance()
	saveLoadSystem.save_game(game_data.score, game_data.cps, game_data.cpc, game_data.level)
	print("Juego guardado con los datos: score = %.1f, cps = %.1f, cpc = %d, level = %d" % [
		game_data.score, game_data.cps, game_data.cpc, game_data.level 
	])

func _on_Timer_timeout():
	var game_data = wasamamaya._get_instance()
	game_data.score += game_data.cps
	save_game()
