extends Node2D
var item_container:VBoxContainer
var some_data:int = 0
class Exception:
	var message:String
	func _init(message:String):
		self.message = message
		printerr(message)


# Called when the node enters the scene tree for the first time.
func _ready():
	item_container = $CenterContainer/ItemContainer
	add_menu_item("Increment", func():
		some_data += 1
	)
	add_menu_item("Save", Save.save_data)
	add_menu_item("Load", Save.load_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_menu_item(text:String, callback:Callable):
	var menu_item := Button.new()
	menu_item.text = text
	menu_item.pressed.connect(callback)
	item_container.add_child(menu_item)
