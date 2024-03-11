extends Node2D
var item_container:VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	item_container = $CenterContainer/ItemContainer
	add_menu_item("Test", test_function)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_menu_item(text:String, callback:Callable):
	var menu_item := Button.new()
	menu_item.text = text
	menu_item.pressed.connect(callback)
	item_container.add_child(menu_item)
	
func test_function():
	print("Test function called.")
