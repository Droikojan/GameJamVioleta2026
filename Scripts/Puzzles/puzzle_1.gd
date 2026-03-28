extends CanvasLayer

var buttonPressed := false

func _on_button_a_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón A")
	_close_puzzle()


func _on_button_b_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón B")
	_close_puzzle()


func _on_button_c_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón C")
	_close_puzzle()


func _on_button_d_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón D")
	_close_puzzle()

func _close_puzzle() -> void:
	queue_free()
