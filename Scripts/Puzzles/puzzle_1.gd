extends CanvasLayer

var buttonPressed := false

func _on_button_a_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón A")


func _on_button_b_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón B")


func _on_button_c_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón C")


func _on_button_d_pressed() -> void:
	if buttonPressed:
		return
	buttonPressed = true
	print("Botón D")
