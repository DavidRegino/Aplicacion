# GameData.gd

extends Node

# Clase Singleton para almacenar datos del juego
class_name GameData

# Variables globales
var dinero = 0

# Función para obtener la instancia del Singleton
func _get_instance():
	return self
