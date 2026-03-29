extends CanvasLayer

@export var puzzle_id : int = 1
@export var dialog_id : String = "none"
@export var dialog_next_id : String = "none"

@export var win_sound : AudioStreamPlayer = null
@export var fail_sound : AudioStreamPlayer = null

@export var respuesta : Sprite2D = null

var puzzle_finished := false

func _on_button_a_pressed() -> void:
	if puzzle_finished:
		return
	puzzle_finished = true
	if win_sound != null:
		win_sound.play()
	if respuesta != null:
		respuesta.show()
	GameController._puzzle_finished(puzzle_id)
	_close_puzzle()


func _on_button_b_pressed() -> void:
	if puzzle_finished:
		return
	if fail_sound != null:
		fail_sound.play()
	GameController._puzzle_failed()


func _on_button_c_pressed() -> void:
	if puzzle_finished:
		return
	if fail_sound != null:
		fail_sound.play()
	GameController._puzzle_failed()


func _on_button_d_pressed() -> void:
	if puzzle_finished:
		return
	if fail_sound != null:
		fail_sound.play()
	GameController._puzzle_failed()

func _close_puzzle() -> void:
	if dialog_id != "none":
		TextBox._load_dialog(dialog_id)
		await TextBox.finish_textbox
	if dialog_next_id != "none":
		TextBox._load_dialog(dialog_next_id)
	TransitionController.close_puzzle(self)
