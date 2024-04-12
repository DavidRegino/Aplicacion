# GameData.gd

extends Node

# Clase Singleton para almacenar datos del juego
class_name GameData

static var instance = null

# Variables globales
var score = 90
var CPC_count = 1
var CPS_count = 0

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
	return CPC_count

func increase_CPC_count():
	self.CPC_count += 1
	
func get_CPS_count():
	return CPC_count

func increase_CPS_count():
	self.CPS_count += 1

