extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var game_data = wasamamaya._get_instance()
	$VBoxContainer/Score.text = "IQ: " + str(round(game_data.score * 10) / 10)
	$VBoxContainer/CPS.text = "CPS: " + str(round(game_data.cps * 10) / 10)
	$VBoxContainer/CPC.text = "CPC: " + str(round(game_data.cpc * 10) / 10)
	$VBoxContainer2/ca1.text = "Objeto1: " + str(round(game_data.ca1 * 10) / 10)
	$VBoxContainer2/ca2.text = "Objeto2: " + str(round(game_data.ca2 * 10) / 10)
	$VBoxContainer2/ca3.text = "Objeto3: " + str(round(game_data.ca3 * 10) / 10)
	$VBoxContainer2/ca4.text = "Objeto4: " + str(round(game_data.ca4 * 10) / 10)
	$VBoxContainer2/ca5.text = "Objeto5: " + str(round(game_data.ca5 * 10) / 10)
	$VBoxContainer2/ca6.text = "Objeto6: " + str(round(game_data.ca6 * 10) / 10)
