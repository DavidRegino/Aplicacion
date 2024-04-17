extends Node2D

var notas = ["jaja se murio", "chido", "se invento *insertar mamada*"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var nota = notas[randi() % notas.size()]
	$noticia.text = nota
	$noticia/AnimationPlayer.play("scroll")
	print("xd")
