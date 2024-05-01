extends Node2D

var NodeData
func _ready():
	#LoadGame()
	#print("Valor: ",NodeData)
	print("Nada")

# Called when the node enters the scene tree for the first time.
func Save():
	var SaveAll = {
		
		"Score" : 1000,
		"CPS" : 1,
		"Age" : "Void"
	}
	return SaveAll
	
func SaveGame():
	var SaveGame = FileAccess.open("user://SaveGameData.save", FileAccess.WRITE)
	
	var JsonString = JSON.stringify(Save())
	
	SaveGame.store_line(JsonString)

func LoadGame():
	if not FileAccess.file_exists("user://SaveGameData.save"):
		return 0
		
	var SaveGame = FileAccess.open("user://SaveGameData.save", FileAccess.WRITE)
		
	while SaveGame.get_position() < SaveGame.get_length():
		var JsonString = SaveGame.get_line()
		var Json = JSON.new()
		var ParseResult = Json.parse(JsonString)
		NodeData = Json.get_data()

		print(NodeData)
