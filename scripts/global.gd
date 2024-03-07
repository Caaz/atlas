extends Node

var Transition = load("res://scenes/transition/transition.tscn")

var _target_scene: String
var _scene_tree: SceneTree
var _transition_animation_player: AnimationPlayer
var _transition_node: CanvasLayer
func change_scene_to(path: String) -> void:
	if ResourceLoader.exists(path):
		_scene_tree = get_tree()
		_target_scene = path
		
		_transition_node = Transition.instantiate()
		# Get the window node, and add the transition node
		_scene_tree.root.add_child(_transition_node)
		
		_transition_animation_player = _transition_node.get_node("AnimationPlayer")
		_transition_animation_player.play("transition_in")
		_transition_animation_player.animation_finished.connect(_on_transition_end)
	else:
		printerr("The scene path does not exist: ", path)

func _on_transition_end(_animation_name: String):
	if _animation_name == "transition_in":
		print_verbose("changing scene to ", _target_scene)
		_scene_tree.change_scene_to_file(_target_scene)
		_transition_animation_player.play("transition_out")
	elif _animation_name == "transition_out":
		_transition_node.queue_free()
