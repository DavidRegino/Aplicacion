extends Control

var construccion = Construcciones.new()
const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
var game_data = wasamamaya._get_instance()
# Called when the node enters the scene tree for the first time.

func _ready():
	for obj in construccion.objetos:
		var button = Button.new()
		button.text = obj["name"] + " - " + str(obj["price"]) + " gold"
		var item_id = obj["item_id"]
		button.pressed.connect(self._button_pressed, [obj["item_id"]])
		add_child(button)

func _button_pressed(item_id):
	print("webos")


