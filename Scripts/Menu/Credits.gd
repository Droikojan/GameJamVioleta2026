extends Control

func _on_return_button_pressed() -> void:
	get_tree().get_first_node_in_group("TransitionController").load_level("uid://5ok4y36qvqnn")
