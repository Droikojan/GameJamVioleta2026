extends TextureButton

@export var puzzle_scene_route : String = "res://Scenes/Puzzles/puzzle_1.tscn"
@export var dialog_id_before : String = "none"
@export var dialog_id_after : String = "none"

var puzzle_scene

var was_pressed := false

func _ready() -> void:
	puzzle_scene = load(puzzle_scene_route)

func _on_pressed() -> void:
	if was_pressed == false:
		was_pressed = true
		
		if dialog_id_before != "none":
			TextBox._load_dialog(dialog_id_before)
			await TextBox.finish_textbox
		
		var instance = puzzle_scene.instantiate()
		TransitionController.load_puzzle(instance, self)
		await TransitionController.get_node("AnimationPlayer").animation_finished
		
		if dialog_id_after != "none":
			TextBox._load_dialog(dialog_id_after)
	else:
		print("Ya pulsado")
