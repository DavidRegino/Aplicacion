extends Node

var DefaultData: Dictionary = {"Cps": 0, "Cpc": 1, "Level": 1, "Iq": 0, "StoreCpc": 500, "StoreCps": 250}
var SaveFilePath: String = "user://Saves/SaveData.json"

func SaveGameData(cps: int, cpc: int, level: int, iq: int, StoreCpc: int, StoreCps: int) -> void:
	var SaveData = {"Cps": cps, "Cpc": cpc, "Level": level, "Iq": iq, "StoreCpc": StoreCpc, "StoreCps": StoreCps}
	var DataFile = FileAccess.open(SaveFilePath, FileAccess.WRITE)
	if DataFile:
		DataFile.store_string(JSON.stringify(SaveData))
		DataFile.close()
		print("Datos guardados:", SaveData)
	else:
		print("Error al abrir el archivo para guardar.")

func LoadGameData() -> Dictionary:
	var DataFile = FileAccess.open(SaveFilePath, FileAccess.READ)
	if DataFile:
		var SaveData = JSON.parse_string(DataFile.get_as_text())
		DataFile.close()
		if typeof(SaveData) == TYPE_DICTIONARY:
			print("Contenido del archivo JSON:", SaveData)
			return SaveData
		else:
			print("Error al parsear el archivo JSON, cargando datos predefinidos.")
	else:
		print("No se encontró el archivo de guardado, cargando datos predefinidos.")
	return DefaultData
