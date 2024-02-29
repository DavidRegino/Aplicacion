extends Button

var cantidad=0

var label : Label

func _ready():
		# Crear un nuevo nodo Label
		label = $Label
func _pressed():
	
	cantidad +=1
	
	print(cantidad)
	label.text = "Valor: " + str(cantidad)
	
	pass # Replace with function body.
