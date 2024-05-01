extends Node2D



func _ready():
	LoadGame()
	print("Culo")
	
# Called when the node enters the scene tree for the first time.
func Save():
	var SaveAll = {
		
		"Score" : 1000,
		"CPS" : 1,
		"Age" : "Void"
	}
	return SaveAll
	
func SaveGame():
	var SaveTheGame = FileAccess.open("user://SaveGameData.save", FileAccess.WRITE)
	
	var JsonString = JSON.stringify(Save())
	
	SaveTheGame.store_line(JsonString)
	

func LoadGame():
	if not FileAccess.file_exists("user://SaveGameData.save"):
		return
		
	var SaveTheGame = FileAccess.open("user://SaveGameData.save", FileAccess.READ)
	print("Ass")
	print("Position: ",SaveTheGame.get_position())
	print("Largo: ",SaveTheGame.get_length())
	
	
	while SaveTheGame.get_position()-1 < SaveTheGame.get_length():
		var JsonString = SaveTheGame.get_line()
		var Json = JSON.new()
		var ParseResult = Json.parse(JsonString)
		var NodeData = Json.get_data()
		print(NodeData)
