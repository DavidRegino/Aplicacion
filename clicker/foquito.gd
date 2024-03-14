extends RigidBody2D


func _ready():
	pass

func _on_timer_timeout():
	print("eso")
	queue_free()
