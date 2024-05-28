extends RigidBody2D

var tiempo_desvanecimiento = 3.0 # Tiempo en segundos para que el sprite se desvanezca completamente
var opacidad_inicial = 1.0 # Opacidad inicial del sprite

func _ready():
	# Configurar la opacidad inicial del sprite
	self.modulate.a = opacidad_inicial

	# Iniciar el temporizador para el desvanecimiento gradual
	$Timer.wait_time = tiempo_desvanecimiento / opacidad_inicial
	$Timer.start()

func start_fade_out():
	$Timer.start()

func _on_timer_timeout():
	var nueva_opacidad = self.modulate.a - (opacidad_inicial / tiempo_desvanecimiento) * $Timer.wait_time
	self.modulate.a = max(0, nueva_opacidad)
	if self.modulate.a <= 0:
		self.queue_free()
