extends Node

const VERSION = 0
var _data:Dictionary = {
	"version":VERSION,
	"migration":0,
	"units": [],
}

var _migrations:Array[Callable] = [
	func():
		pass,
	func():
		pass,
]


func save_data():
	var save:FileAccess = FileAccess.open("user://debug_save.json", FileAccess.WRITE)
	var json:String = JSON.stringify(_data)
	save.store_string(json)
	save.close()
	
func load_data():
	var save_string:String = FileAccess.get_file_as_string("user://debug_save.json")
	var data:Dictionary = JSON.parse_string(save_string)
	
	while(data["migration"] < _migrations.size()):
		_migrations[data["migration"]].call(data)
		data["migration"] += 1
