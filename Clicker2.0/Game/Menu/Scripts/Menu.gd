extends Node

@onready var DataSystem := preload("res://Game/Data/SaveSystem/SaveData.gd").new()
var Level: int

func _ready():
	var SaveData: Dictionary = DataSystem.LoadGameData()
	Level = SaveData["Level"]

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Game/Levels/Level" + str(Level) + ".tscn")
