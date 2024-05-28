# GameData.gd

extends Node

# Clase Singleton para almacenar datos del juego
class_name GameData

static var instance = null

# Variables globales
var score: int
var cpc: int = 1
var cps: int
var level: int
var iq: int

func load_from_dict(data: Dictionary):
	score = data.get("score")
	cps = data.get("cps")
	cpc = data.get("cpc")
	level = data.get("level")
	iq = data.get("iq")
	
# Función para convertir las variables a un diccionario
func to_dict() -> Dictionary:
	return {
		"score": score,
		"cps": cps,
		"cpc": cpc,
		"level": level,
		"iq": iq
	}
# Función para obtener la instancia del Singleton
static func _get_instance():
	if instance == null:
		instance = GameData.new()
	return instance
	
func get_score():
	return score

func add_score(points):
	self.score += points
	
func get_CPC_count():
	return cpc

func increase_CPC_count():
	self.cpc += 1
	
func get_CPS_count():
	return cps

func increase_CPS_count():
	self.cps += 1

