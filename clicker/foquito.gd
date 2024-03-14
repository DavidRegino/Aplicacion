extends RigidBody2D

func _on_timer_timeout():
	# Obtener una referencia al AnimationPlayer
	var animation_player = get_node("transparencia")
	
	# Reproducir la animación de desvanecimiento
	animation_player.play("opacidad")  # Reemplaza "opacidad" con el nombre de tu animación de desvanecimiento
