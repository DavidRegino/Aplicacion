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

# De aqui en adelante es el boton

@warning_ignore("unused_parameter")
func _process(delta):
	var game_data = wasamamaya._get_instance()
	$VBoxContainer/Score.text = "IQ: " + str(round(game_data.score * 10) / 10)
	$VBoxContainer/CPS.text = "CPS: " + str(round(game_data.cps * 10) / 10)
	$VBoxContainer/CPC.text = "CPC: " + str(round(game_data.cpc * 10) / 10)
	#if game_data.score >= 1000:
		#print("ganaste")
		#$Ganaste.visible = true

func _on_Timer_timeout():
	var game_data = wasamamaya._get_instance()
	game_data.score += game_data.cps
	save_game()

func _on_boton_pressed():

	var sonido_boton = $sonido_boton
	sonido_boton.play()
	var spawn_de_foquito = foquito.instantiate()
	# Obtener las coordenadas del mouse en relación con el mundo
	var mouse_position = get_global_mouse_position()
	
	add_child(spawn_de_foquito) #aparece el foco
	
	# Establecer la posición del cuerpo rígido de la galleta en las coordenadas del mouse
	spawn_de_foquito.global_position = mouse_position
	  # Aplicar fuerza inicial a la galleta (opcional)
	spawn_de_foquito.get_node("RigidBody2D").apply_impulse(Vector2(0, -200), Vector2.ZERO)
	# Iniciar temporizador para desaparición de la galleta
	spawn_de_foquito.get_node("Timer").start()
	
	var game_data = wasamamaya._get_instance()
	game_data.score += game_data.cpc
	save_game()

	
func _on_tanganana_pressed():
	get_tree().change_scene_to_file("res://escenas perronas/tangananica.tscn")

	
