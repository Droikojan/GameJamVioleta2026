extends Control

func _ready() -> void:
	DamagedMask.animation_player.play("RESET")
	GameController.puzzle_failed = false
	DamagedMask.puzzle_failed = false

func _on_play_button_pressed() -> void:
	TransitionController.load_level("uid://cow3mdict3hp4")

func _on_settings_button_pressed() -> void:
	MenuSettings.show_settings()

func _on_creddits_button_pressed() -> void:
	TransitionController.load_level("uid://ydaiibkxuya0")
