extends Node2D


var cantidad=0

var label : Label

func _ready():
		# Crear un nuevo nodo Label
		label = Label.new()
		# Establecer el texto inicial
		label.text = "Valor: " + str(cantidad)
		# Agregar el Label a la escena
		add_child(label)
# Called when the node enters the scene tree for the first time.
func _pressed():
	
	cantidad +=1
	
	print(cantidad)
	label.text = "Valor: " + str(cantidad)
	pass # Replace with function body.

