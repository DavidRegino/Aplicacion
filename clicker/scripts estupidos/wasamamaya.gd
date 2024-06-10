# GameData.gd

extends Node

# Clase Singleton para almacenar datos del juego
class_name GameData

static var instance = null

# Variables globales
var score: float
var cps: float
var cpc: int = 1
var level: int

# Variables de precio de tienda de CPS
var CPS1: int
var CPS2: int
var CPS3: int
var CPS4: int
var CPS5: int
var CPS6: int

#Variables cantidad de construcciones y mejoras
var ca1: int
var ca2: int
var ca3: int
var ca4: int
var ca5: int
var ca6: int
var cm1: int

#Variables de Mejoras
var M1: int

func load_from_dict(data: Dictionary):
	score = data.get("score")
	cps = data.get("cps")
	cpc = data.get("cpc")
	level = data.get("level")
	CPS1 = data.get("CPS1")
	CPS2 = data.get("CPS2")
	CPS3 = data.get("CPS3")
	CPS4 = data.get("CPS4")
	CPS5 = data.get("CPS5")
	CPS6 = data.get("CPS6")
	M1 = data.get("M1")
	ca1 = data.get("ca1")
	ca2 = data.get("ca2")
	ca3 = data.get("ca3")
	ca4 = data.get("ca4")
	ca5 = data.get("ca5")
	ca6 = data.get("ca6")
	cm1 = data.get("cm1")
	
# Función para convertir las variables a un diccionario
func to_dict() -> Dictionary:
	return {
		"score": score,
		"cps": cps,
		"cpc": cpc,
		"level": level,
	#Tienda	
		"CPS1": CPS1,
		"CPS2": CPS2,
		"CPS3": CPS3,
		"CPS4": CPS4,
		"CPS5": CPS5,
		"CPS6": CPS6,
	#Cantidad
		"ca1": ca1,
		"ca2": ca2,
		"ca3": ca3,
		"ca4": ca4,
		"ca5": ca5,
		"ca6": ca6,
		"cm1": cm1,
	}
# Función para obtener la instancia del Singleton
static func _get_instance():
	if instance == null:
		instance = GameData.new()
	return instance
