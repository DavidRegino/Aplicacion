extends Node
# Datos predefinidos en caso de que no exista un archivo de guardado
var defaultData: Dictionary = {
	"score": 0,
	"cps": 0,
	"cpc": 1,
	"level": 1
}
# Ruta del archivo de guardado
var saveFilePath: String = "user://SaveData.json"

# Función para guardar los datos en un archivo JSON
func save_game(score: float, cps: float, cpc: int, level: int) -> void:
	var saveData: Dictionary = {
		"score": score,
		"cps": cps,
		"cpc": cpc,
		"level": level
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
		if saveData != null and saveData.has("score") and saveData.has("cps") and saveData.has("cpc") and saveData.has("level"):
			return saveData
		else:
			print("Error al parsear el archivo JSON.")
	else:
		print("No se encontró el archivo de guardado, cargando datos predefinidos.")
	return defaultData
