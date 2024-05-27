extends Sprite2D

@onready var DataSystem := preload("res://Game/Data/SaveSystem/SaveData.gd").new()
@onready var Counts := $Counts
@onready var Store := $Store

var Cps: int
var Cpc: int
var Level: int
var Iq: int
var StoreCpc: int
var StoreCps: int

func _ready():
	Cps = GlobalData.Cps
	Cpc = GlobalData.Cpc
	Level = GlobalData.Level
	Iq = GlobalData.Iq

	LabelUpdate()
	
	# Pasa la referencia de Counts a Store
	Store.set_counts(Counts)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			GlobalData.Iq += GlobalData.Cpc
			print("IQ = ", GlobalData.Iq)
			print("Click Por Click = ", GlobalData.Cpc)
			LabelUpdate()

func SaveGameData():
	DataSystem.SaveGameData(GlobalData.Cps, GlobalData.Cpc, GlobalData.Level, GlobalData.Iq, GlobalData.StoreCpc, GlobalData.StoreCps)
	print("Juego guardado con los datos: cps = %d, cpc = %d, level = %d, iq = %d" % [GlobalData.Cps, GlobalData.Cpc, GlobalData.Level, GlobalData.Iq])

func _on_auto_save_timeout():
	SaveGameData()
	print("Juego guardado")

func LabelUpdate():
	Counts.get_node("Cps").set_text("Clicks por segundo: " + str(GlobalData.Cps))
	Counts.get_node("Cpc").set_text("Clicks por Click: " + str(GlobalData.Cpc))
	Counts.get_node("Level").set_text("Nivel: " + str(GlobalData.Level))
	Counts.get_node("Iq").set_text("Iq: " + str(GlobalData.Iq))


func _on_cps_timeout():
	GlobalData.Iq += GlobalData.Cps
	print("Cps: ", GlobalData.Cps)
	LabelUpdate()
	
