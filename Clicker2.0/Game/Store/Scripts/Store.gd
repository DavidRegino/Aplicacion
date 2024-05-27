extends Control

@onready var DataSystem := preload("res://Game/Data/SaveSystem/SaveData.gd").new()
@onready var Items = $Items
var Counts
var PopUp
 
func set_counts(counts_instance):
	Counts = counts_instance

func _ready():
	PopUp = Items.get_popup()
	PopUp.id_pressed.connect(Store)
	PopUp.set_item_text(0, "Clicks por click +1 : " + str(GlobalData.StoreCpc))
	PopUp.set_item_text(1, "Clicks por click +1 : " + str(GlobalData.StoreCps))
	

func _process(delta):
	LevelUpgrade()

func LevelUpgrade():
	if GlobalData.Iq >= 10000 and GlobalData.Level == 1:
		GlobalData.Level += 1
		print("Nivel subido a: ", GlobalData.Level)
		get_tree().change_scene_to_file("res://Game/Levels/Level" + str(GlobalData.Level) + ".tscn")
		LabelUpdate()

func Store(id):
	
	print(GlobalData.Iq)
	match(id):
		0:
			if GlobalData.Iq >= GlobalData.StoreCpc:
				print("Comprado cpc")
				print("Valor: ",GlobalData.StoreCpc)
				GlobalData.Iq -= GlobalData.StoreCpc
				GlobalData.StoreCpc = round(GlobalData.StoreCpc * 1.15)
				PopUp.set_item_text(id, "Clicks por click +1 : " + str(GlobalData.StoreCpc)) 
				print("Valor Tienda: ",GlobalData.StoreCpc)
				GlobalData.Cpc += 1
				print("Cpc: ", GlobalData.Cpc)
				print("Iq: ", GlobalData.Iq)
				LabelUpdate()
				SaveGameData()
			else:
				print("Iq Insuficiente")
		1:
			if GlobalData.Iq >= GlobalData.StoreCps:
				print("Comprado cps")
				print("Valor: ",GlobalData.StoreCps)
				GlobalData.Iq -= GlobalData.StoreCps
				GlobalData.StoreCps = round(GlobalData.StoreCps * 1.15)
				PopUp.set_item_text(id, "Clicks por click +1 : " + str(GlobalData.StoreCps)) 
				print("Valor Tienda: ",GlobalData.StoreCps)
				GlobalData.Cps += 1
				print("Cpc: ", GlobalData.Cps)
				print("Iq: ", GlobalData.Iq)
				LabelUpdate()
				SaveGameData()
			else:
				print("Iq Insuficiente")

func SaveGameData():
	DataSystem.SaveGameData(GlobalData.Cps, GlobalData.Cpc, GlobalData.Level, GlobalData.Iq, GlobalData.StoreCpc, GlobalData.StoreCps)
	print("Juego guardado con los datos: cps = %d, cpc = %d, level = %d, iq = %d" % [GlobalData.Cps, GlobalData.Cpc, GlobalData.Level, GlobalData.Iq])

func LabelUpdate():
	Counts.get_node("Cps").set_text("Clicks por segundo: " + str(GlobalData.Cps))
	Counts.get_node("Cpc").set_text("Clicks por Click: " + str(GlobalData.Cpc))
	Counts.get_node("Level").set_text("Nivel: " + str(GlobalData.Level))
	Counts.get_node("Iq").set_text("Iq: " + str(GlobalData.Iq))
