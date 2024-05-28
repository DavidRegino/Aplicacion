extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
var foquito = preload("res://escenas perronas/foquito.tscn")
@onready var saveLoadSystem = load("res://SaveSystem.gd").new()
var score: int
var cps: int
var cpc: int
var level: int
var iq: int

func _ready():
	var game_data = wasamamaya._get_instance()
	var saveData: Dictionary = saveLoadSystem.load_game()
	game_data.score = saveData["score"]
	game_data.cps = saveData["cps"]
	game_data.cpc = saveData["cpc"]
	game_data.level = saveData["level"]
	game_data.iq = saveData["iq"]
	print("Datos iniciales cargados: ", saveData)

# Función para guardar el juego
func save_game():
	var game_data = wasamamaya._get_instance()
	saveLoadSystem.save_game(game_data.score, game_data.cps, game_data.cpc, game_data.level, iq)
	print("Juego guardado con los datos: score = %d, cps = %d, cpc = %d, level = %d, iq = %d" % [
		game_data.score, game_data.cps, game_data.cpc, game_data.level, game_data.iq
	])

# Timer de guardado automatico
func _on_autoguardado_timeout():
	save_game()


# De aqui en adelante es el boton

@warning_ignore("unused_parameter")
func _process(delta):
	var game_data = wasamamaya._get_instance()
	$Score.text = "IQ: " + str(game_data.score)


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
	

	
func _on_tanganana_pressed():
	get_tree().change_scene_to_file("res://escenas perronas/tangananica.tscn")


func _on_tienda_perrona_pressed():
	get_tree().change_scene_to_file("res://escenas perronas/tienda.tscn")
