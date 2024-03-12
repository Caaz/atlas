extends Node2D
var item_container:VBoxContainer
var some_data:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	item_container = $CenterContainer/ItemContainer
	add_menu_item("Test", test_function)
	add_menu_item("Increment", func():
		some_data += 1
	)
	add_menu_item("Save", save_data)
	add_menu_item("Load", load_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_menu_item(text:String, callback:Callable):
	var menu_item := Button.new()
	menu_item.text = text
	menu_item.pressed.connect(callback)
	item_container.add_child(menu_item)
	
func test_function():
	print("Test function called. ", some_data)

func save_data():
	var save:FileAccess = FileAccess.open("user://debug_save.json", FileAccess.WRITE)
	var json:String = JSON.stringify(to_representation())
	save.store_string(json)
	save.close()
	
func load_data():
	var save_string:String = FileAccess.get_file_as_string("user://debug_save.json")
	var save_data:Dictionary = JSON.parse_string(save_string)
	from_representation(save_data)
	
func to_representation() -> Dictionary:
	# Serializes this node's saveable data into a dictionary.
	return {
		"some_data" : some_data
	}

func from_representation(data:Dictionary):
	for key in data.keys():
		print("Loading ",key,": ",data[key])
		set(key, data[key])
