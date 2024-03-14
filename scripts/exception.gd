extends Object

class_name Exception

var message:String

func _init(message:String):
	self.message = message
	printerr(self.message)
