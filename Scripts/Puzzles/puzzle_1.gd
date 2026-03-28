extends CanvasLayer

@export var puzzle_id : int = 1

var puzzle_finished := false

func _on_button_a_pressed() -> void:
	if puzzle_finished:
		return
	puzzle_finished = true
	print("Botón A")
	GameController._puzzle_finished(puzzle_id)
	_close_puzzle()


func _on_button_b_pressed() -> void:
	if puzzle_finished:
		return
	print("Botón B")
	GameController._puzzle_failed()


func _on_button_c_pressed() -> void:
	if puzzle_finished:
		return
	print("Botón C")
	GameController._puzzle_failed()


func _on_button_d_pressed() -> void:
	if puzzle_finished:
		return
	print("Botón D")
	GameController._puzzle_failed()

func _close_puzzle() -> void:
	TransitionController.close_puzzle(self)
