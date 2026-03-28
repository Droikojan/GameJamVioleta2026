extends Control

func _on_play_button_pressed() -> void:
	get_tree().get_first_node_in_group("TransitionController").load_level("uid://cow3mdict3hp4")

func _on_settings_button_pressed() -> void:
	MenuSettings.show()

func _on_creddits_button_pressed() -> void:
	pass # Replace with function body.
