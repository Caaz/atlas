extends Node
const Exception = preload("res://scripts/exception.gd")


const REVISION:int = 0
var _data:Dictionary = {
	"revision":REVISION,
	"migration":0,
	"units": [],
}

# When a major change of the save format happens, a migration should be added to ensure past saves load correctly.
var _migrations:Array[Callable] = []

func save_data():
	var save:FileAccess = FileAccess.open("user://debug_save.json", FileAccess.WRITE)
	var json:String = JSON.stringify(_data)
	save.store_string(json)
	save.close()

func load_data(skip_revision_check:bool = false):
	var save_string:String = FileAccess.get_file_as_string("user://debug_save.json")
	var data:Dictionary = JSON.parse_string(save_string)

	if !skip_revision_check & data["revision"] != REVISION:
		return Exception.new("Save revision doesn't match current game revision")
	
	while(data["migration"] < _migrations.size()):
		print("Running Migration ",data["migration"])
		_migrations[data["migration"]].call(data)
		data["migration"] += 1

	_data = data
