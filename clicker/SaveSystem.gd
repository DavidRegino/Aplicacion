extends Node
# Datos predefinidos en caso de que no exista un archivo de guardado
var defaultData: Dictionary = {
	"score": 0,
	"cps": 0,
	"cpc": 1,
	"level": 1,
#Tienda	
	"CPS1": 15,
	"CPS2": 100,
	"CPS3": 1100,
	"CPS4": 12000,
	"CPS5": 130000,
	"CPS6": 1400000,
	"M1": 100,
#Cantidades	
	"ca1": 0,
	"ca2": 0,
	"ca3": 0,
	"ca4": 0,
	"ca5": 0,
	"ca6": 0,
	"cm1": 0
}
# Ruta del archivo de guardado
var saveFilePath: String = "user://SaveData.json"

# Función para guardar los datos en un archivo JSON
func save_game(score: float, cps: float, cpc: int, level: int, CPS1: int, CPS2: int, CPS3: int, CPS4: int, CPS5: int, CPS6: int, M1: int, ca1: int, ca2: int, ca3: int, ca4: int, ca5: int, ca6: int, cm1: int) -> void:
	var saveData: Dictionary = {
		"score": score,
		"cps": cps,
		"cpc": cpc,
		"level": level,
		"CPS1": CPS1,
		"CPS2": CPS2,
		"CPS3": CPS3,
		"CPS4": CPS4,
		"CPS5": CPS5,
		"CPS6": CPS6,
		"M1": M1,
		"ca1": ca1,
		"ca2": ca2,
		"ca3": ca3,
		"ca4": ca4,
		"ca5": ca5,
		"ca6": ca6,
		"cm1": cm1
	}
	var file := FileAccess.open(saveFilePath, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(saveData))
		file.close()
		print("Datos guardados: ", saveData)
	else:
		print("Error al abrir el archivo para guardar.")

func load_game() -> Dictionary:
	var file := FileAccess.open(saveFilePath, FileAccess.READ)
	if file:
		var content: String = file.get_as_text()
		print("Contenido del archivo JSON:", content) # Mensaje de depuración
		var saveData = JSON.parse_string(content)
		file.close()
		if saveData != null and saveData.has("score") and saveData.has("cps") and saveData.has("cpc") and saveData.has("level")  and saveData.has("CPS1") and saveData.has("CPS2") and saveData.has("CPS3") and saveData.has("CPS4") and saveData.has("CPS5") and saveData.has("CPS6")  and saveData.has("M1") and saveData.has("ca1") and saveData.has("ca2") and saveData.has("ca3") and saveData.has("ca4") and saveData.has("ca5") and saveData.has("ca6") and saveData.has("cm1"):
			return saveData
		else:
			print("Error al parsear el archivo JSON.")
	else:
		print("No se encontró el archivo de guardado, cargando datos predefinidos.")
	return defaultData
