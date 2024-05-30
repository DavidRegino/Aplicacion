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
