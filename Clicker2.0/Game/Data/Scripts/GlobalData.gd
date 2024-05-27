extends Node

@onready var DataSystem := preload("res://Game/Data/SaveSystem/SaveData.gd").new()

var Cps: int
var Cpc: int
var Level: int
var Iq: int
var StoreCpc: int
var StoreCps: int

func _ready():
	var SaveData: Dictionary = DataSystem.LoadGameData()
	Cps = SaveData["Cps"]
	Cpc = SaveData["Cpc"]
	Level = SaveData["Level"]
	Iq = SaveData["Iq"]
	StoreCpc = SaveData["StoreCpc"]
	StoreCps = SaveData["StoreCps"]	
	print("Datos cargados:", SaveData)
