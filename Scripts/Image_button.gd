extends TextureButton

@export var puzzle_scene_route : String = "res://Scenes/Puzzles/puzzle_1.tscn"
var puzzle_scene

var was_pressed := false

func _ready() -> void:
	puzzle_scene = load(puzzle_scene_route)

func _on_pressed() -> void:
	if was_pressed == false:
		was_pressed = true
		var instance = puzzle_scene.instantiate()
		add_child(instance)
	else:
		print("Ya pulsado")
