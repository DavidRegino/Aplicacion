extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
var foquito = preload("res://escenas perronas/foquito.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
