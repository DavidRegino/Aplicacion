extends Node

@onready var saveLoadSystem := preload("res://SaveSystem.gd").new()
var cps: int
var cpc: int
var level: int
var iq: int

func _ready():
	var saveData: Dictionary = saveLoadSystem.load_game()
	cps = saveData["cps"]
	cpc = saveData["cpc"]
	level = saveData["level"]
	iq = saveData["iq"]
	print("Datos iniciales cargados: ", saveData)

# Función para guardar el juego
func save_game():
	saveLoadSystem.save_game(cps, cpc, level, iq)
	print("Juego guardado con los datos: cps = %d, cpc = %d, level = %d, iq = %d" % [cps, cpc, level, iq])

# Función para añadir datos (ejemplo: aumentar en 1 el valor de cps)
func add_data():
	cps += 1
	print("Datos actualizados: cps = %d" % cps)

# Conecta esta función a un botón de añadir en tu escena
func _on_add_button_pressed():
	add_data()

# Conecta esta función a un botón de guardado en tu escena
func _on_save_button_pressed():
	save_game()

# Conecta esta función a un botón de carga en tu escena
func _on_load_button_pressed():
	var saveData: Dictionary = saveLoadSystem.load_game()
	cps = saveData["cps"]
	cpc = saveData["cpc"]
	level = saveData["level"]
	iq = saveData["iq"]
