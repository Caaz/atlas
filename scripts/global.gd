extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Function to change the current scene to a new scene specified by 'path'
func change_scene_to(path: String) -> void:
	# Ensure the path is valid to avoid runtime errors
	if ResourceLoader.exists(path):
		# Get the current SceneTree and change the scene
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file(path)
	else:
		print("The scene path does not exist: ", path)
